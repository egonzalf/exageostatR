\name{exageostat_emleR}
\alias{exageostat_emleR}
\title{ Sets up the call to the mle_exact() C language function accessed via the  R '.C' external function call API }
\description{
  \code{exageostat_emleR} demonstrates the R / C language interface
}

\usage{
exageostat_emleR(n,
		ncores,
		gpus,
		ts,
		p_grid,
		q_grid,
		x,
		y,
		z,
		clb,
		cub,
		dmetric)
}

\arguments{
  \item{ n	 }{ Integer - number of locations in the incoming data (real mode) or generated data (test mode) }
  \item{ ncores  }{ Integer - CPU threads }
  \item{ gpus    }{ Integer - GPU threads }
  \item{ ts      }{ Integer - tile size }
  \item{ p_grid  }{ Integer - (p,q) 2-D block-cyclic distribution grid }
  \item{ q_grid  }{ Integer - (p,q) 2-D block-cyclic distribution grid }
  \item{ x       }{ Double vector - x locations}
  \item{ y       }{ Double vector - y locations }
  \item{ z       }{ Double vector - z observations at (x, y) }
  \item{ clb     }{ Double vector - optimizer lower bounds theta values }
  \item{ cub     }{ Double vector - optimizer upper bounds theta values }
  \item{ dmetric     }{ String - "dm" or "gcd" }
}

\value{
   Returned value: vector of three values (theta1, theta2, theta3)
  \item{ theta_out   }{ Double vector - theta_out }
}
\author{ Sameh Abdulah, Postdoctoral Fellow, Extreme Computing and Research Center, KAUST \email{sameh.abdulah@kaust.edu.sa}}

\examples{
#
# inline call at R command line or in another R function:
# Provides function arguments for and calls the R exageostat__gen_zR() function.
#
#mle_exact(n,
#               ncores,
#               gpus,
#               ts,
#               p_grid,
#		q_grid,
#		theta,
#		dmetric)
}


\keyword{programming}
