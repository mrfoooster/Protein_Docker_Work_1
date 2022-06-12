#!/bin/bash

### user: mert cem tatar
### version: v.0.0.1
### date: 12/06/2022
###
###



usage() {      ###explanation of which command lines are present in the code
	cat <<EOF
	Options:
		 -m	 --mode              Select mode <build|deploy|template> 
		 -n	 --image-name        Docker image name
		 -t	 --image-tag         Docker image tag
		 -M 	 --memory            Container memory limit
		 -c  	 --cpu               Container cpu limit
		 -C  	 --container-name    Container name
		 -R  	 --registery         DocherHub or GitLab Image registery
		 -a  	 --application-name  Run mysql or mongo server

EOF
}

[ $# -eq 0 ] && usage  ### in the event of code just executed witout command lines, it will show them for the user

while getopts ':m:n:t:M:c:C:R:a' option ; do   ##getopts line
	case "$option"  in
		"m" | "mode")		       ## mode line and its possible arguments, build and deploy
			if [ $2 == "build" ]; then
				docker build
				echo "hoho"

			elif [ $2 == "deploy" ]; then
				docker run
				echo "koko"

			else
				break		##incase build or deploy order doesnt written on terminal, abandon.
			fi
			shift

			;;

		"n" | "image-name")	      ## naming image with $2
			if [ -z "$2" ]; then
				echo "ERROR"  ##if no name has been given, terminate the program
				exit 1
			else
				docker build -f $2
			fi
			shift

			;;

		"t" | "image-tag")	     ## tagging the image with $2
			if [ -z "$2" ]; then
				echo "ERROR" ## if no tag has been given, terminate the program
				exit 1
			else
				docker build -f $2
			fi
			shift

			;;

		"M" | "memory")		     ## determining whether memory should be finite or infinite
			if [ -z $2 ]; then
				ulimit -s unlimited
			fi
			shift

			;;

		"c" | "cpu")		    ##determining cpu limit,  
			if [ -z $2 ]; then
				cpulimit -l $2
			else
				cpulimit -b ##if cpu limit is given, set it to $2
			fi
			shift
			
			;;

		"R" | "registery") 	    ## deciding whether to push to image to docker or git registry
			if [ "$2" = "dockerhub" ]; then
				docker push
			elif [ "$2" = "gitlab image registery" ]; then
				git push	
			else
				break	   ## incase something else been written, abandon.
			fi
			
	esac
done

			



					
