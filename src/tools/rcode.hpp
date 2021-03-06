#ifndef __RCODE_HPP__
#define __RCODE_HPP__

#include <boost/numeric/ublas/fwd.hpp>
#include <boost/shared_ptr.hpp>
#include <ublas_functors.hpp>
#include <rprop.hpp>

class RCode{
	public:
		typedef double precision;
		typedef boost::numeric::ublas::matrix<precision> mat_t;
		typedef boost::numeric::ublas::vector<precision> vec_t;
	public:
		// co-occurrence probabilities
		mat_t        mPxy;     ///< co-occurrence matrix of X and Y
		mat_t        mPxx;     ///< co-occurrence matrix of X and X

		// marginals
		vec_t        mMx;      ///< marginal of X (sum over Y in mPxy)
		vec_t        mMy;      ///< marginal of Y (sum over X in mPxy)
		vec_t        mMxx;     ///< marginal of X (sum over X in mPxx) 

		unsigned int mDim;     ///< target dimension
		mat_t        mXpos;    ///< position of X objects
		mat_t        mYpos;    ///< position of Y objects

		// some general parameters
		bool         mUse_Pxx; ///< whether to use pxx matrix
		bool         mUse_Pxy; ///< whether to use pxy matrix
		std::string  mModel;   ///< model (one of as UU, UM, MU, MM)
		int          mRPropMaxIter; ///< maximum rprop iterations
		bool         mFixXpos; ///< whether to fix the x positions
		bool         mFixYpos; ///< whether to fix the y positions

	private:
		bool         mPosInitialized; ///< whether positions were initialized


	public:
		/// Constructor
		RCode(int dim):mDim(dim),mPosInitialized(false){}

		template <class T>
		void setPxy(const T& m, bool div=true){ 
			mPxy  = m; 
			if(div)
				mPxy /= boost::numeric::ublas::sum(mPxy); 
		}

		template <class T>
		void setPxx(const T& m, bool div=true){
			mPxx  = m; 
			if(div){
				double sum = boost::numeric::ublas::sum(mPxx); 
				mPxx /= sum;
			}
		}

		double run(int);
		void init_positions();
		void configure();
	private:
		void prepare_marginals();
		double calculate_gradient(RProp&);
		double calculate_gradient(const mat_t& pxy, const vec_t& mx, const vec_t& my, const mat_t& xpos, const mat_t& ypos, const vec_t& a, const vec_t& b, const vec_t& a_mult, const vec_t& b_mult, mat_t& xgrad, mat_t& ygrad);

		/// function pointer to the derivative of the log-likelihood 
		precision (RCode::*dl_dphix) (unsigned int x, unsigned int dim, double Z);
		/// function pointer to the derivative of the log-likelihood 
		precision (RCode::*dl_dpsiy) (unsigned int x, unsigned int dim, double Z);

		precision pcm_xgrad(unsigned int x, unsigned int dim, double Z);
		precision pcm_ygrad(unsigned int y, unsigned int dim, double Z);
};

#endif /* __RCODE_HPP__ */

