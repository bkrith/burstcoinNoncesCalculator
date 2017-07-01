 
#!/bin/sh

size=0
tp='n'
 
if [ "$*" == "" ]; then
  echo "nonceCalc size type_of_capacity"
  echo "type_of_capacity : mb, gb or tb"
  echo "example"
  echo "./nonceCalc.sh 100 gb"
  exit 1
fi
 
if [ $# -lt 2 ]
  then
    echo "Wrong Arguments"
    echo "please type ./nonceCalc.sh without parameters for help"; exit 1
  else
    size=$1
    tp=$2
    nonces=0

    re='^[0-9]+$'
    
    if ! [[ $size =~ $re ]] ; then
      echo "error: Size is not a number" >&2; exit 1
    fi 
    if ! [ $tp = 'mb' -o $tp = 'gb' -o $tp = 'tb' ] ; then
      echo "error: Type of capacity must be mb, gb or tb" >&2; exit 1
    fi 
    
    if [ $tp = 'mb' ] ; then
      ((nonces = 1024 * $size))
    elif [ $tp = 'gb' ] ; then
      ((nonces = 1024 * 1024 * $size))
    elif [ $tp = 'tb' ] ; then
      ((nonces = 1024 * 1024 * 1024 * $size))
    fi
    
    (( nonces = $nonces / 256 ))
    
    echo "Plot File $size $tp size has $nonces nonces"
fi
