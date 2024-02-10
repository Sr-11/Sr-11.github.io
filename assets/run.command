cd $( dirname -- "$0"; )
#./jemdoc -c mysite.conf main.jemdoc -o index.html index
./jemdoc -o ../index.html index
#./jemdoc -o ../CV.html CV
./jemdoc -o ../random.html random
