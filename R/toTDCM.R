toTDCM <- function(coxdata) {
	UseMethod("toTDCM")
}

toTDCM.default <- function(coxdata) {
	stop("The requested conversion isn't implemented!", call.=FALSE)
}

toTDCM.CMM <- function(coxdata) {
	if ( !inherits(coxdata, "CMM") ) stop("'coxdata' must be of class 'CMM'", call.=FALSE)
	dados <- cbind(coxdata$id, coxdata$start, coxdata$stop, coxdata$event, coxdata$covariate, coxdata$trans)
	dados <- data.frame(dados, row.names=NULL)
	names(dados) <- c("id", "start", "stop", "event", "covariate", "trans")
	data <- dados
	data2 <- matrix(ncol=6, nrow=1)
	i <- 1
	while ( i <= (nrow(data)-1) ) {
		if (data[i,1] == data[i+1,1] & data[i,4] == 0 & data[i+1,4]==0) {
			aux1 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 0)
			data2 <- rbind(data2, aux1)
			i <- i+2
		}
		if (i <= (nrow(data)-1) & data[i,6]==1 & data[i,4]==1) {
			aux1 <- c(data[i,1], 0, data[i,3], 1, data[i,5], 0)
			data2 <- rbind(data2, aux1)
			i <- i+2
		}
		if (i <= (nrow(data)-1) & data[i,1] == data[i+1,1] & data[i,4] == 0 & data[i+1,4] == 1) {
			if (data[i+2,4] == 0) {
				aux1 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 0)
				aux2 <- c(data[i,1], data[i,3], data[i+2,3], 0, data[i,5], 1)
				data2 <- rbind(data2, aux1, aux2)
			}
			if (data[i+2,4] == 1) {
				aux1 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 0)
				aux2 <- c(data[i,1], data[i,3], data[i+2,3], 1, data[i,5], 1)
				data2 <- rbind(data2, aux1, aux2)
			}
			i <- i+3
		}
	}
	data2 <- data.frame(data2, row.names=NULL)
	names(data2) <- c("id", "start", "stop", "event", "covariate", "tdcov")
	data2 <- data2[-1,]
	class(data2) <- c(class(data2), "TDCM")
	return(data2)
}

toTDCM.THMM <- function(coxdata) {
	if ( !inherits(coxdata, "THMM") ) stop("'coxdata' must be of class 'THMM'", call.=FALSE)
	dados <- cbind(coxdata$PTNUM, coxdata$time, coxdata$state, coxdata$covariate)
	dados <- data.frame(dados, row.names=NULL)
	names(dados) <- c("PTNUM", "time", "state", "covariate")
	data <- dados
	data2 <- matrix(ncol=6, nrow=1)
	i <- 1
	while( i <= nrow(data) ) {
		if (data[i,3] == data[i+1,3] & data[i+1,3] == 1) {
			aux <- c(data[i,1], 0, data[i+1,2], 0, data[i,4], 0)
			data2 <- rbind(data2, aux)
			i <- i+2
		} else {
			if (data[i,3] == 1 & data[i+1,3] == 3) {
				aux <- c(data[i,1], 0, data[i+1,2], 1, data[i,4], 0)
				data2 <- rbind(data2, aux)
				i <- i+2
			} else {
				aux <- c(data[i,1], 0, data[i+1,2], 0, data[i,4], 0)
				data2 <- rbind(data2, aux)
				i <- i+2
				if (data[i,3] == 2) {
					aux <- c(data[i,1], data[i-1,2], data[i,2], 0, data[i,4], 1)
					data2 <- rbind(data2, aux)
					i <- i+1
				} else {
					aux <- c(data[i,1], data[i-1,2], data[i,2], 1, data[i,4], 1)
					data2 <- rbind(data2, aux)
					i <- i+1
				}
			}
		}
	}
	data2 <- data.frame(data2, row.names=NULL)
	names(data2) <- c("id", "start", "stop", "event", "covariate", "tdcov")
	data2 <- data2[-1,]
	class(data2) <- c(class(data2), "TDCM")
	return(data2)
}
