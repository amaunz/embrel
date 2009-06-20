import sys
import getopt
import string
import os


def setRecursiveHash(hash,keyList=[],value=None,debug=False):
    if debug:
        print 'debug::%s' % key
    if len(keyList) > 1:
        try:
            hash[keyList[0]]
        except:
            hash[keyList[0]] = {}
        setRecursiveHash(hash[keyList[0]],keyList[1:],value)
    elif len(keyList) == 1:
        hash[keyList[0]] = value

class Converter:

    def __init__(self,inFile=None,outFileStem=None):
        (self.features,self.molecules) = self.readMiningResults(inFile)
        self.writeFilesForErl(outFileStem)

    def readMiningResults(self,inFile):
        features = []
        molecules = {'active':{},'inactive':{}}
        if os.path.exists(inFile):
            fh = open(inFile)
            data = fh.readlines()
            fh.close()

            list = []

            for line in data:
                #print line[1:]
                list = tuple(eval('%s' % line[1:]))
                (patternS,pvalueS,inactivesS,activesS) = (list[0],list[1],list[2],list[3])
                features.append(patternS)
                for inactive in inactivesS:
                    setRecursiveHash(molecules,['inactive',inactive,patternS],1)
                for active in activesS:
                    setRecursiveHash(molecules,['active',active,patternS],1)
        return (features,molecules)



    def writeFilesForErl(self,outFileNameStem=None):
        if outFileNameStem:
            fhMols  = open('%s.csv' % outFileNameStem,'w')
            if self.features and self.molecules:
                for activity in ['active','inactive']:
                    for mol in self.molecules[activity]:
                        lineL = []
                        lineL.append('%s' % mol)
                        for feature in self.features:
                            try:
                                lineL.append('%s' % self.molecules[activity][mol][feature])
                            except:
                                lineL.append('%s' % 0)
                                pass
                        if activity == 'active':
                            lineL.append('%s' % 1)
                        else:
                            lineL.append('%s' % 0)
                        fhMols.writelines([string.join(lineL,',')+'\n'])
            fhMols.close()
            fhFeats = open('%s-names.csv' % outFileNameStem,'w')
            fhFeats.writelines(map(lambda x: '%s\n' % x, self.features))
            fhFeats.close()

coverter = Converter(sys.argv[1],sys.argv[1])
