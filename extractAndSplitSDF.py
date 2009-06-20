import sys
import getopt
import re
import os
import openbabel, pybel

def setHash(hash,key,value,debug=False):
    if debug:
        print 'debug::%s' % key
    try:
        hash[key] = value
    except:
        print key
        pass

class SDFReader:

    molecules = {}
    fieldStructure = {'animals' : ['Dog_Primates','Hamster','Mouse','Rat'],'cell'    : ['MultiCellCall','SingleCellCall'],'muta'    : ['Mutagenicity'],'td50'    : ['mg','note','mmol'],'sex'     : ['Female','Male','BothSexes'],'targetS' : ['Cynomolgus', 'Rhesus']}

    filename = ''

    def __init__(self, filename=None):
        if filename:
            molecules = [mol for mol in pybel.readfile("sdf", filename)]
            possibleFields = {}
            for mol in molecules:
                map(lambda x: setHash(possibleFields,x,1), mol.data)
            dataEntryKeys = possibleFields.keys()
            dataEntryKeys.sort()
            #for key in dataEntryKeys:
            #    print key
            map(lambda x: setHash(self.molecules,x.data['STRUCTURE_InChIKey'],x), molecules)
            print len(self.molecules)
            self.filename = filename
            
    def getMolecules(self,what=('ActivityOutcome','Mouse'),activity=None,format='smi'):
        returnMols = []
        returnActs = []
        if what[0] == 'ActivityOutcome':
            mols = []
            if not activity:
                for x in self.molecules:
                    try:
                        if self.molecules[x].data['ActivityOutcome_CPDBAS_%s' % (what[1])] != 'blank':
                            mols.append(self.molecules[x])
                    except:
                        pass
            else:
                for x in self.molecules:
                    try:
                        if self.molecules[x].data['ActivityOutcome_CPDBAS_%s' % (what[1])] == activity:
                            mols.append(self.molecules[x])
                    except:
                        pass
            returnMols = []
            if format=='smi':
                returnMols = map(lambda x : '%s\t# CID=%s\tactivity=%s\n' % (x.write().strip(),x.data['DSSTox_CID'],x.data['ActivityOutcome_CPDBAS_%s' % (what[1])]), mols)
            elif format=='fminer':
                returnMols = map(lambda x : '%s\t%s\n' % (x.data['DSSTox_CID'], x.write().strip()), mols)
                endpoint = 'CPDBAS_%s' % (what[1])
                returnActs = map(lambda x : '%s\t%s\t%s\n' % (x.data['DSSTox_CID'], endpoint ,((x.data['ActivityOutcome_CPDBAS_%s' % (what[1])]) == 'active' and '1' or '0')), mols)
            elif format=='sdf':
                returnMols = map(lambda x : '%s' % (x.write('sdf')), mols)
                #endpoint = 'CPDBAS_%s' % (what[1])
                #returnActs = map(lambda x : '%s\t%s\t%s\n' % (x.data['DSSTox_CID'], endpoint ,((x.data['ActivityOutcome_CPDBAS_%s' % (what[1])]) == 'active' and '1' or '0')), mols)
            return (returnMols,returnActs)
            
    def writeMols(self,what=('ActivityOutcome','Mouse'),activity=None,format='smi'):
        nameStem = os.path.splitext(os.path.basename(self.filename))[0]
        outFilename = '%s_%s_%s' % (nameStem,what[0],what[1])
        if activity != None:
            outFilename += '_%s' % (activity)
        outFilenameStructures = outFilename + '.%s' % (format)
        outFilenameActivities = outFilename + '.act'
        (mols,actvities) =  self.getMolecules(what=what,activity=activity,format=format)
        fh = open(outFilenameStructures,'w')
        fh.writelines(mols)
        fh.close()
        if actvities:
            fh = open(outFilenameActivities,'w')
            fh.writelines(actvities)
            fh.close()
            
        


sdf = SDFReader('../cpdb/dsstox/CPDBAS_v5d_1547_20Nov2008.sdf')
#sdf.writeMols(format='fminer',activity='active')
#sdf.writeMols(format='fminer',activity='inactive')
#sdf.writeMols(format='fminer')
sdf.writeMols(format='sdf',activity='inactive')
#for mol in sdf.getMolecules(format='fminer',activity='inactive'):
#    print mol
