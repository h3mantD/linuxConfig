# Applicaton commands
lotion() {
    cd /home/n00b/WorkSpace/tools/lotion/Lotion
    sudo ./Lotion --no-sandbox

}


# Normal upgraded commands
lsa() {
    ls -la
}

getcnt() {
    cat $1 | wc -l
}


# arpits bash_profile
ipinfo() {
    curl http://ipinfo.io/$1
}

crtsh() {
    curl -s https://crt.sh\?q\=%25.$1\&output\=json | jq . | grep 'name_value' | awk '{print $2}' | sed -e 's/"//g'| sed -e 's/,//g' |  awk '{gsub(/\\n/,"\n")}1' | sort -u
}

dirsearch(){
    cd /home/n00b/WorkSpace/tools/dirsearch
    python3 dirsearch.py -u https://$1/ -e htm,html,js,json,zip,asp,aspx,php,bak,sql,old,txt,gz,gz.tar -x 301,404,400 -t 200
    cd
}

crtshauto(){
for i in `cat target.txt`
do
        curl -s https://crt.sh/\?q\=$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u  | tee -a all.txt
done
}
#1)create a file named target.txt and store all your subdomains that you got from crtsh and certspotter.
#2)./crtshauto.sh
#3)It will find all multi level subdomains and store it in all.txt



fileuploadchecker(){
curl --upload-file test.txt $1
}


#To get more ip's/subdomains
ipinfo.io target
crt.sh %.target.com
asntoip(){
curl https://ipinfo.io/$1 >/dev/null | hxnormalize -x | hxselect '#ipv4-data tr>tda::attr(href)' -s '\n' | cut -d'/' -f3- | sed 's/.$//'
}
#$1 is asn number that you will get from ipinfo.io website.It looks like 'https://ipinfo.io/AS26444' here asn number is AS26444
#before running above command make sure to install html-xml-utils
sudo apt-get install html-xml-utils
##OR##
whois -h whois.radb.net  -- '-i origin AS36459' | grep -Eo "([0-9.]+){4}/[0-9]+" | uniq


#To find open ports of an ip range:-
mscan(){
sudo masscan -p80,443,8020,50070,50470,19890,19888,8088,8090,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,10000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,7447,7080,8880,8983,5673,7443,19000,19080 --rate=100000 --open --range $1 --banners -oG $2.txt
}
$1 is single ip range
$2 is output file name

#To find open ports from list of ip address

mscanl(){
sudo masscan -p80,443,8020,50070,50470,19890,19888,8088,8090,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,4000,8888,10000,5432,15672,9999,161,4044,7077,4040,9000,8089,7447,7080,8880,8983,5673,7443,19000,19080 --rate=100000 --open -iL $1 --banners -oG $2.txt
}
$1 is name of file containing ip list
$2 is name of output file

asntoip(){
whois -h whois.radb.net  -- '-i origin '$1'' | grep -Eo "([0-9.]+){4}/[0-9]+" | uniq | tee -a ip.txt
}

fd(){
findomain -a -o $2 -t $1
}


third_level_crtsh(){
echo "Gathering alive third-level domains with crtsh..."
for domain in $(cat third-level.txt);do curl -s https://crt.sh/?q=%.domain | sed 's/<\/\?[^>]\+>//g' | grep $domain | httprobe | tee -a third_alive.txt;done
}
#for gathering third level subdomains using crtsh

third_level(){
cat all.txt | grep -Po "(\w+\.\w+\.\w+)$" | sort -u | tee -a third-level.txt
}
#gathering third level domains from all.txt


sublist3r_probe(){
mkdir thirdlevels

echo "Gathering full third level domains with Sublist3r..."
for domain in $(cat third-level.txt);do sublist3r -d $domain -o thirdlevels/$domain.txt;cat thirdlevels/$domain.txt | sort -u >> final.txt;done

echo "Probing for alive third-levels..."
cat final.txt | httprobe | tee -a probed.txt
}
#this will get thirl level domains from "third_level" script and feed it to sublist3r and then sublist3r will find its subdomains and store it in a folder and all of them will be probed in final.txt


export PATH="$HOME/.cargo/bin:$PATH"
