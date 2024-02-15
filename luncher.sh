sudo /etc/init.d/apache2 stop
sudo /opt/lampp/lampp start

prog() {
    local w=20 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d %% %s" "$w" "$dots" "$p" "$*"; 
}

for x in {1..100} ; do
    prog "$x" Proceeding to the CRONEM...
    sleep .02   
    if [ $x -eq 100 ]; then
        cd "cronem"
    fi
done ; 
echo "CRONEM Reached!"

for x in {1..100} ; do
    prog "$x" Starting Development...
    sleep .01   
    if [ $x -eq 100 ]; then
        php artisan serve
    fi
done ; 