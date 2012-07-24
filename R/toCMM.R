toCMM <- function(coxdata) {
	UseMethod("toCMM")
}

toCMM.default <- function(coxdata) {
	stop("The requested conversion isn't implemented!", call.=FALSE)
}

toCMM.TDCM <- function(coxdata) {
	if ( !inherits(coxdata, "TDCM") ) stop("'coxdata' must be of class 'TDCM'", call.=FALSE)
	dados <- cbind(coxdata$id, coxdata$start, coxdata$stop, coxdata$event, coxdata$covariate, coxdata$tdcov)
	dados <- data.frame(dados, row.names=NULL)
	names(dados) <- c("id", "start", "stop", "event", "covariate", "tdcov")
	data <- dados
	data2 <- matrix(ncol=6, nrow=1)
	i <- 1
	while ( i <= (nrow(data)-1) ) {
		if (data[i,1] != data[i+1,1] & data[i,4] == 0) {
			aux1 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 1)
			aux2 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 2)
			data2 <- rbind(data2, aux1, aux2)
			i <- i+1
		}
		if (i <= (nrow(data)-1) & data[i,1] != data[i+1,1] & data[i,4] == 1) {
			aux1 <- c(data[i,1], 0, data[i,3], 1, data[i,5], 1)
			aux2 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 2)
			data2 <- rbind(data2, aux1, aux2)
			i <- i+1
		}
		if (i <= (nrow(data)-1) & data[i,1] == data[i+1,1] & data[i,4] == 0) {
			if (data[i+1,4] == 0) {
				aux1 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 1)
				aux2 <- c(data[i,1], 0, data[i,3], 1, data[i,5], 2)
				aux3 <- c(data[i,1], data[i,3], data[i+1,3], 0, data[i,5], 3)
				data2 <- rbind(data2, aux1, aux2, aux3)
			}
			if (data[i+1,4] == 1) {
				aux1 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 1)
				aux2 <- c(data[i,1], 0, data[i,3], 1, data[i,5], 2)
				aux3 <- c(data[i,1], data[i,3], data[i+1,3], 1, data[i,5], 3)
				data2 <- rbind(data2, aux1, aux2, aux3)
			}
			i <- i+2
		}
	}
	if ( i == nrow(data) ) {
		if (data[i,4] == 0) {
			aux1 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 1)
			aux2 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 2)
			data2 <- rbind(data2, aux1, aux2)
			i <- i+1
		}
		if (data[i,4] == 1) {
			aux1 <- c(data[i,1], 0, data[i,3], 1, data[i,5], 1)
			aux2 <- c(data[i,1], 0, data[i,3], 0, data[i,5], 2)
			data2 <- rbind(data2, aux1, aux2)
			i <- i+1
		}
	}
	data2 <- data.frame(data2, row.names=NULL)
	names(data2) <- c("id", "start", "stop", "event", "covariate", "trans")
	data2 <- data2[-1,]
	class(data2) <- c(class(data2), "CMM")
	return(data2)
}

toCMM.THMM <- function(coxdata) {
	if ( !inherits(coxdata, "THMM") ) stop("'coxdata' must be of class 'THMM'", call.=FALSE)
	dados <- cbind(coxdata$PTNUM, coxdata$time, coxdata$state, coxdata$covariate)
	dados <- data.frame(dados, row.names=NULL)
	names(dados) <- c("PTNUM", "time", "state", "covariate")
	data <- dados
	data2 <- matrix(ncol=6, nrow=1)
	i <- 1
	while ( i <= (nrow(data)-1) ) {
		if (data[i,2] != 0) i <- i+1
		if (data[i,2] == 0 & data[i+1,3] == 1) {
			aux1 <- c(data[i,1], 0, data[i+1,2], 0, data[i,4], 1)
			aux2 <- c(data[i,1], 0, data[i+1,2], 0, data[i,4], 2)
			data2 <- rbind(data2, aux1, aux2)
		}
		if(data[i,2] == 0 & data[i+1,3] == 3) {
			aux1 <- c(data[i,1], 0, data[i+1,2], 1, data[i,4], 1)
			aux2 <- c(data[i,1], 0, data[i+1,2], 0, data[i,4], 2)
			data2 <- rbind(data2, aux1, aux2)
		}
		if (data[i,2] == 0 & (i+2) <= nrow(data) & data[i+1,3] == 2) {
			if (data[i+2,3] == 2) {
				aux1 <- c(data[i,1], 0, data[i+1,2], 0, data[i,4], 1)
				aux2 <- c(data[i,1], 0, data[i+1,2], 1, data[i,4], 2)
				aux3 <- c(data[i,1], data[i+1,2], data[i+2,2], 0, data[i,4], 3)
				data2 <- rbind(data2, aux1, aux2, aux3)
			}
			if (data[i+2,3] == 3) {
				aux1 <- c(data[i,1], 0, data[i+1,2], 0, data[i,4], 1)
				aux2 <- c(data[i,1], 0, data[i+1,2], 1, data[i,4], 2)
				aux3 <- c(data[i,1], data[i+1,2], data[i+2,2], 1, data[i,4], 3)
				data2 <- rbind(data2, aux1, aux2, aux3)
			}
		}
		i <- i+1
	}
	data2 <- data.frame(data2, row.names=NULL)
	names(data2) <- c("id", "start", "stop", "event", "covariate", "trans")
	data2 <- data2[-1,]
	class(data2) <- c(class(data2), "CMM")
	return(data2)
}
