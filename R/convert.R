convert <- function(data, to) {
	if ( !( to %in% c("CMM", "TDCM", "THMM") ) ) stop("Argument 'to' must be one of 'CMM', 'TDCM' or 'THMM'", call.=FALSE)
	func <- switch(to, "CMM"=toCMM, "TDCM"=toTDCM, "THMM"=toTHMM)
	return( func(data) )
}
