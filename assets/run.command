cd $( dirname -- "$0"; )
#conda init
#conda activate jemdoc
source /opt/anaconda3/bin/activate jemdoc
#./jemdoc -c mysite.conf main.jemdoc -o index.html index
./jemdoc -o ../index.html index
#./jemdoc -o ../CV.html CV
./jemdoc -o ../random.html random
