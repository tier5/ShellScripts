#!/bin/bash

# A script to produce an HTML file
TITLE="System Information for $HOSTNAME"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"
VAR1="4"
VAR2="6"

#Functions

function system_info
{
   if [ $(id -u) = "1000" ]; then
	    echo "Superuser"
	fi
}


function show_uptime
{
    echo "Uptime:" 
    uptime
}

function calculate(){

    sum=$(expr "$1" + "$2")
    echo "Addition of two variables: $sum"

}

cat <<- _EOF_
    <HTML>
    <HEAD>
        <TITLE>
        $TITLE
        </TITLE>
    </HEAD>

    <BODY>
    <H1>$TITLE</H1>
    <p>$TIME_STAMP</p>
    <p>$(system_info)</p>
    <p>$(show_uptime)</p>
    <p>Variable 1 = $VAR1</p>
    <p>Variable 2 = $VAR2</p>
    <p>$(calculate $VAR1 $VAR2)</p>
    </BODY>
    </HTML>
_EOF_
