#!/bin/bash
#
# TESTNETCOINS.IO LEADERBOARD v0.1 by CN
# Input: Tester wallet Addresses
# Output: Leaderboard TX Counts Sorted
# vlog1.txt plog1.txt

# Define timestamp
timestamp() {
  date +"%Y-%m-%d"
}
# Preview
declare -a varray=(
"stake_test1urndsx7k6wepy582uwtajwuka2v3vrvsg8zau64ttmtx46c04x7fp"
"stake_test1uptpd74fewegrylmkt22nqqtvde87kw7nvls36l6fkl4u4qmxpehd"
"stake_test1urej9ktqhyzsfk0qfj73rgn0pc0krrvfgpflrqyez5v50tcgl897m"
"stake_test1uq0gr0uuf4y6k4y7sslp48g73ncjmapf3upfjjm85c7hr3g5825su"
"stake_test1uzdtrau46juwj9us5j24cff0wqk3gu4x27ahhlp6m83kzlsujvdaj"
"stake_test1urcn5zg7ersay97cnqcl424ll09pzjmm5pe33v9wf45mkcg8njez4"
"stake_test1uzq93a7ydjnhff99t23tumqkw6w4zu4ce3j4a3gklk7kpsq5qshff"
"stake_test1uqnat2dv4gwx739kjy0vxufy7r63zkhkhuzurfsn008mh4crrhgyd"
"stake_test1uzdeyy0k6372ygj3vjd2602jjkfrpq3zzw2fzgrmsxrfnhq9w0vtc"
"stake_test1urtyr6csqlhe2n4rlg5jrm2x3mvucw8ha7ezdlqd50597hcp0m8qa"
"stake_test1uqkycsln37cycnsra85edkjq0v6d8wpmv3dtdm967z5a4ysmn6n4g"
"stake_test1uq7usgv0pmpzpzk7q5u58x8xdqydg8qkej97pl5czyvaplgkry499"
"stake_test1urm2xy7p09j9lsnrunvy8jxmetr0xm0gwkx7f8n93jexm3qjh5g0u"
"stake_test1uq852w8vl8365rp7pfzw92mrz6nkyt6937udmt57t7yqq5q2erksr"
"stake_test1ur2ecdjzlj7w3lcke2sgu2eqat7rs337ugh0j7ql3t5lfxsk9mq4z"
"stake_test1uqf483ttcwzvuu055rgwa4d8cern25vvz7mxh6ufcx6zxfs5actq6"
"stake_test1uqwk7zl3vk8vv08ur630fc0n3cfxh90e65jkcnlm45e375szr8a90"
"stake_test1uph7hz0s98tpx2hutl8lugn353faa8r859zkelzs9un6sqqckv9z4"
"stake_test1uq6zkqusy67t0sqyu6fxpn9d49xg9xggzka4fq3ruhsq94swnh5y3"
"stake_test1urt3fyxfvvvgpve9m6sxxh3rzwqce2qcf95ej3j37zhrh7q27z3q8"
"stake_test1uztf9sejrp75mzv5v9y5wvxzptl7udww2gk4pfgy875fg8s7zhuhn"
"stake_test1uq0j6u6cdxfnzzje5tn3u6zaxugdvkafjc37dzf4tkassxsuujd77"
"stake_test1uq3lzlpqp3wdqe6ghn664lhjna5aeedfq7kk2v9jx5sxq9quau6rx"
"stake_test1uqypewhfntue3rkcqe66qcn63r485ze0wmqanxh327ycjgcqqzd83"
"stake_test1uzct6pddhlgt286rxrtqa284eqgd8r98v7mxs2vmelvvs8c0e6jkp"
"stake_test1uz4zywvtfe3d24jl6nyfz9ay5yl9jjrhvpves7ycgj5r9ecrqpl3p"
"stake_test1uzd8kfny6x092fuqn5spxqf753q7ep2dz8szc2ly283yvwcawvc68"
"stake_test1upey39hey75y4a3f2lmkk07fv4rffdzclznh4696qrzk00s7e7t7v"
)

# PreProd
declare -a parray=(
"stake_test1urmpsd7wc295nhekhq3993f08m6nu93ckvc4mxk7puqu0fsv5mlne"
"stake_test1uzw5kggxcdpy3508enq6ccy52laskn2r9mqdpgmuf83yzwcldv55v"
"stake_test1uzdeyy0k6372ygj3vjd2602jjkfrpq3zzw2fzgrmsxrfnhq9w0vtc"
"stake_test1uqy94nh03xy2qlmecenujksqa4w3rkd85e89509rz9n0s5cjrcpp7"
"stake_test1up2a4em2glu9xu3jcqd6cllhd52lpp44vlgjk0r3qurwrxc4krjxt"
"stake_test1uqcnflfzxs5qq8vzum2mkmqd4r82ddmd3ph4xuheftwvasg2kray2"
"stake_test1up354a3rdnucgjtm5tmq08jsfuussnxl22g07cjwsn93nhc2er0nc"
"stake_test1up354a3rdnucgjtm5tmq08jsfuussnxl22g07cjwsn93nhc2er0nc"
"stake_test1uzlefd8wxl5w4gv7h2c2kulf82ud40tuecqrtqd7dc5rttc3rwyzj"
"stake_test1uquctzxvvujl2kz9tcp6uf77ktm7fzgdn3jmk8r8vpk42fqtfx2wj"
"stake_test1uqccws60a4tf0lfyxgx2uv270gt50f7r2jzxh2gkaz4g8ssdveqp3"
"stake_test1uzxzs4v2kt9j6vleggksuanc2fgylsqeufmmqn0gp4xqm8s72452r"
"stake_test1uzxzs4v2kt9j6vleggksuanc2fgylsqeufmmqn0gp4xqm8s72452r"
"stake_test1urqu9ra0tk6gs0he4p6n7gzu4fl0c5d8m43gz2v6ddc4etsctkflq"
"stake_test1uzhnnx3yf6zcxghaxwcfnn8ndnkcx3g9ec3welew4hyewyq5rk5ap"
"stake_test1upwgrkj706n60334k98smhdyh80ch30sl56sm6zlhxaw46gsu34nz"
)

COUNT=0

rm vlog.txt
arraylength=${#varray[@]}

echo "TESTNETCOINS.IO LEADERBOARD v0.1"
timestamp
echo "Preview > vlog.txt" $arraylength

for (( i=0; i<${arraylength}; i++ ));
do

  curl -s -H "project_id: previewCEUos82btjxhRfIQa95caOKFJ1QZYlIt" "https://cardano-preview.blockfrost.io/api/v0/accounts/${varray[$i]}/addresses/total" -o txs.json
  COUNT=$(jq .tx_count txs.json)
  rm txs.json
  echo "$COUNT ${varray[$i]}"
  echo "$COUNT ${varray[$i]}" >>  vlog.txt

done

COUNT=0

rm plog.txt
arraylength=${#parray[@]}
echo "PreProd > plog.txt" $arraylength

for (( i=0; i<${arraylength}; i++ ));
do

  curl -s -H "project_id: preproduFoZ6i7GDBn5ORrA40999bwPEeSR2Dx2" "https://cardano-preprod.blockfrost.io/api/v0/accounts/${parray[$i]}/addresses/total" -o txs.json
  COUNT=$(jq .tx_count txs.json)
  rm txs.json
  echo "$COUNT ${parray[$i]}"
  echo "$COUNT ${parray[$i]}" >> plog.txt

done

sort -g -r vlog.txt > vlog1.txt
sort -g -r plog.txt > plog1.txt
rm vlog.txt
rm plog.txt
echo "done"
