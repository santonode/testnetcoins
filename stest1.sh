#!/bin/bash
#
# TESTNETCOINS.IO LEADERBOARD v0.2 by CN
# Input: Tester wallet Addresses
# Output: Leaderboard TX Counts Sorted
# vlog1.txt plog1.txt vplog1.txt pplog1.txt

# Define timestamp
timestamp() {
  date +"%Y-%m-%d"
}

# Preview Testers
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
"stake_test1urfz8fgxusywfvuykqmrcwzje6xgcnyvcmg57ms3pue0zqswmvskv"
"stake_test1uptnxvsj7zp8svxy3c0l3gczp6qrfc0xa006qck2rrdw93cdhrrca"
"stake_test1uptnxvsj7zp8svxy3c0l3gczp6qrfc0xa006qck2rrdw93cdhrrca"
"stake_test1urhgvz5w90mwh2lmhw465s0xmwgc0aulut5xz6mfjwxnzfqnhqexr"
"stake_test1ur4tgp9ej8jln7kp62hnvlrv744j5rfrdvurj2xq7lmd4jsxk3xjx"
"stake_test1uqwxlq4f66a2r2rtvvwafnsk8rqxczzlrzwgetc7u2yvnmss9mpnm"
"stake_test1upx0fuqcjqs4h5vp687d8j2cng4y5wkmelc6wzm5szq04qsm5d0l6"
"stake_test1urdd0v5y4m04eqssc0wfhdhemat5ue84sh2lnm5zwhaj8gcw0fydd"
"stake_test1uz5rzsgfkfg40r4xyfuvquluwvjp5s55js3xutqfaj3sp7qxgu5pj"
"stake_test1uqkycsln37cycnsra85edkjq0v6d8wpmv3dtdm967z5a4ysmn6n4g"
"stake_test1uq0svpdrrj5rc9k9zm4755t0lmsekvp8rcg7p8cdxq7pqwsh5yuwn"
"stake_test1uqfzx47st0n0659qfgmyj87nzhkkwyr4egswj7q5ea37atquq6ya5"
"stake_test1uzmh23wg5n32ha8863l3l44d5ezq9w8z8qkrzdc9a0rl44s3h90hp"
"stake_test1uzdnss2rhz079lu6nevsjc6sp2tyy5p28jy05y0rmamlm5g3l3qvw"
"stake_test1urayrfpzhskhel6njh43uhkny2jmqwjkyuja3a7947t70dg4fe0qv"
"stake_test1uzjk2fqnn3hnqra9v956sl9055kzad0yjcr4zceztlrk5eg34fzse"
"stake_test1uqxnlhw58venxnajtaetwhrw8kt3nrz52clpf85s2327n5gqaq00u"
"stake_test1uqh8hkpdmwu2evuxnyzgh9ylvd93dsj23jjk32ygmjn36fq8kummq"
"stake_test1uzdnss2rhz079lu6nevsjc6sp2tyy5p28jy05y0rmamlm5g3l3qvw"
"stake_test1uq0y3nleuuszy5vgmrq0gw67xuwa6uxke8gwcmx0p3ufjjq6dmmqy"
"stake_test1uzj28ydkq2kj548rtz7efstst07xjmqdsrzww6ja83374hsy8ng6p"
"stake_test1uq9zumrs6yy8pzray7hxsltw8e27yuzp9tr0n09z6nh3w0ghukrg2"
"stake_test1uqfztccwfdldzn2vtzd7flyaww8nepzkjhhyjjqjyw4zyzcl6rpg4"
"stake_test1uzja92773ar22zhkrmxw7mnyaeefm8u6fx98uyhnk030e0qmkw64p"
"stake_test1up26hg3sn9zkgdqsaxsntv2ed96e7lfv5y00plr5le52y0gea2une"
)

#Preview Pools
declare -a vparray=(
"pool1ayc7a29ray6yv4hn7ge72hpjafg9vvpmtscnq9v8r0zh7azas9c"
"pool1vzqtn3mtfvvuy8ghksy34gs9g97tszj5f8mr3sn7asy5vk577ec"
"pool1htdmnme5s6d824trqq33czlm82f473w04h4xghprzaj3cff53mp"
"pool1leml52hm4fcp3hhe4zye08qz27llhj7d339p3gs0tl85cstx59q"
"pool1l5u4zh84na80xr56d342d32rsdw62qycwaw97hy9wwsc6axdwla"
"pool1p835jxsj8py5n34lrgk6fvpgpxxvh585qm8dzvp7ups37vdet5a"
"pool1qal80uhlj949mgv0ecvdkmgqjdn5q27wmpaj4crnr5e9v6qmsv7"
"pool1j3x329u0uxh9s9vjvsad9kx37tzal8gndz6ttxumcz4nw947djw"
"pool1z9nsz7wyyxc5r8zf8pf774p9gry09yxtrlqlg5tsnjndv5xupu3"
"pool1pt39c4va0aljcgn4jqru0jhtws9q5wj8u0xnajtkgk9g7lxlk2t"
"pool1h7c2jq3pmvn3f8jht4ulhgha3h60k6syu3rw6pmkfrhqs9j7m0l"
"pool1yphncqvpc4n49c4ya3mys7uwpwa25892r70gzkpqglenv093qge"
"pool1397kpa7ylzg4lqrmj3xr28xzq2548c8lafw90qyxvucsslap03v"
"pool1n6tcrkjjn7dr70e4vjmtayswl2rne947fue7w2htthaq6men4yp"
"pool1da3p2l74sr347ln6gpmmkkqnnupfxhfh2d7fuur2g7twvddm5ua"
)

#PreProd Pools
declare -a pparray=(
"pool1tjc56tq7adk64nnq2ldu3f4nh6sxkphhmnejlu67ux7acq8y7rx"
"pool1egfg26w0syqly9qc65hz33gqv2qrzyka8tfue3ccsk3c73a56jp"
"pool1vntql3yhyzzm3p846mds33nmuzz30jrn56fvjdd3hhu9u5n9d4d"
"pool1kgzq2g7glzcu76ygcl2llhamjjutcts5vhe2mzglmn5jxt2cnfs"
"pool1mvgpsafktxs883p66awp7fplj73cj6j9hqdxzvqw494f7f0v2dp"
"pool1lk6cxjaqd66t4t74q4gd9hymxapd93fvchhxt0uxwwprk9m8v6c"
"pool1nfn2m3lq52hw6l8lq9nlag4lsdvlav2zdl9saptfelh07arxfc5"
"pool1h4n2c2g6c5saatezzs0mpe0z7rknmf33txulf8sl2q9v7e72nky"
"pool1egu0kaxmv3zu54xd80p9u0dcalnywmfru0qnm43hjvfzqa5zw5x"
"pool1n84mel6x3e8sp0jjgmepme0zmv8gkw8chs98sqwxtruvkhhcsg8"
"pool12v43sug6avuwn458fwlx0j72lqrjqqcec9nc9ywk24x0wn7ng46"
"pool1jgl6h9fyy8gqt593ah638kqps4ls7c78d5p00we6qlzycdmhhvq"
"pool1ws42l6rawqjv58crs5l32v0eem3qnngpnjfd7epwd4lmjccc5cg"
)

# PreProd Testers
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
"stake_test1uqfztccwfdldzn2vtzd7flyaww8nepzkjhhyjjqjyw4zyzcl6rpg4"
"stake_test1uzn0ky86k4zfvrkqcal2fna4wlv73q548euyxnwrq5eed6s4vk49t"
"stake_test1urse5h5e24sxthm4uxkk7ultklm6923yn00cw0xqnam5m6sz4jpje"
"stake_test1uzhqqvrrpfujqfmykzjz5amaejga9ufa227kvqypj9vfdnsq3v0n3"
"stake_test1uz96a8z7zjsf766kts2nk8x5pfr6gtkp99sc9vaks4at4jqr3f78j"
"stake_test1uzr9gkrafdvx32yscz6rrrtk4ks3k66gyn847agw6jtdcxgp824wl"
"stake_test1uzz8qj6hphmzyl9s9x8nxv7dre6gfqm6n497qlypt6tprqsv0ckc2"
"stake_test1uz96a8z7zjsf766kts2nk8x5pfr6gtkp99sc9vaks4at4jqr3f78j"
"stake_test1uqj7wj9fn93hfk6qtskms87jf58ecm2tm6v58ancq8e8klc6twkwm"
"stake_test1urtzg5geh5u8evm0lh42fzsn9xueae5krnt66r0h7f9htfcsceg38"
"stake_test1uquseumvzc65n4w62ftnaa6w06d8508glt3a5tkg4mvmrjgxlenfv"
"stake_test1ur7yllksu2qjaq34j5zwgmm995syj3p8vvncuc90ayegt8gqmnmzh"
"stake_test1upkjs9jarpqzylljcemdeufvq7g2xzcr6ng49p5wls629mqh6g5sn"
"stake_test1urqq5wfslqveldd35gklvhk4envqln6ea3syp4lv0dq3msq8pzere"
"stake_test1uprpy3g5549gv5ry89p9qvx0m55a2qepnz76hehh9h8nq9qnncp6x"
"stake_test1upvhmetjsdndf38x5pznpw5nyceanae8dt2fl5cnfv3vt8qu3v35t"
"stake_test1uzathspc7kqxuja7dk7565ztp4ep2rlch50dsjg3nentw0q7lef4m"
"stake_test1urntlujn6jkqrzd4dl8xd0p46v4nt75h394vn9z0g7dzvtcecem0q"
"stake_test1upwpeef7rdcjj9msl5tt7697m28vcq7v74g4j6h2mppavwg9r07jr"
"stake_test1uzn080yta8a5uvjtq488j6et8zfs5x0k8ugjqzm3yffkkqca6hkcc"
"stake_test1ure7hxpelva78entxv9un5ep84ycc0tp58lykvmfnuzdeegf33y7s"
"stake_test1upsazx70st4apj32lkhedcg7cu0y826wg4xtu9y4ks4yaps9hr3yx"
"stake_test1uqpfwynwtvqluzhf3w0j6zfn2au6lxdkkknx42evqf2mwlsgjf2rl"
)

COUNT=0

rm vlog.txt
arraylength=${#varray[@]}

echo "TESTNETCOINS.IO LEADERBOARD v0.1"
timestamp
echo "Preview > vlog.txt" $arraylength

#######################################
# Preview Testers
#######################################
for (( i=0; i<${arraylength}; i++ ));
do

  curl -s -H "project_id: previewCEUos82btjxhRfIQa95caOKFJ1QZYlIt" "https://cardano-preview.blockfrost.io/api/v0/accounts/${varray[$i]}/addresses/total" -o txs.json
  COUNT=$(jq .tx_count txs.json)
  rm txs.json
  echo "$COUNT ${varray[$i]}"
  echo "$COUNT ${varray[$i]}" >>  vlog.txt

done
#######################################

COUNT=0

rm plog.txt
arraylength=${#parray[@]}
echo "PreProd > plog.txt" $arraylength

#######################################
#Preprod Testers
#######################################
for (( i=0; i<${arraylength}; i++ ));
do

  curl -s -H "project_id: preproduFoZ6i7GDBn5ORrA40999bwPEeSR2Dx2" "https://cardano-preprod.blockfrost.io/api/v0/accounts/${parray[$i]}/addresses/total" -o txs.json
  COUNT=$(jq .tx_count txs.json)
  rm txs.json
  echo "$COUNT ${parray[$i]}"
  echo "$COUNT ${parray[$i]}" >> plog.txt

done
#######################################

arraylength=${#vparray[@]}
echo "Preview Pools" $arraylength

#######################################
#Preview Pools
#######################################
for (( i=0; i<${arraylength}; i++ ));
do

curl -s -H "project_id: previewCEUos82btjxhRfIQa95caOKFJ1QZYlIt" "https://cardano-preview.blockfrost.io/api/v0/pools/${vparray[$i]}" -o txs.json
COUNT=$(jq .blocks_minted txs.json)
rm txs.json
#echo "$COUNT ${vparray[$i]}"

curl -s -H "project_id: previewCEUos82btjxhRfIQa95caOKFJ1QZYlIt" "https://cardano-preview.blockfrost.io/api/v0/pools/${vparray[$i]}/metadata" -o txs.json
TICKER=$(jq .ticker txs.json)
rm txs.json
echo "$COUNT $TICKER"
echo "$COUNT $TICKER" >> vplog.txt

done
#######################################

arraylength=${#pparray[@]}
echo "PreProd Pools" $arraylength

#######################################
#PreProd Pools
#######################################
for (( i=0; i<${arraylength}; i++ ));
do

curl -s -H "project_id: preproduFoZ6i7GDBn5ORrA40999bwPEeSR2Dx2" "https://cardano-preprod.blockfrost.io/api/v0/pools/${pparray[$i]}" -o txs.json
COUNT=$(jq .blocks_minted txs.json)
rm txs.json
#echo "$COUNT ${pparray[$i]}"

curl -s -H "project_id: preproduFoZ6i7GDBn5ORrA40999bwPEeSR2Dx2" "https://cardano-preprod.blockfrost.io/api/v0/pools/${pparray[$i]}/metadata" -o txs.json
TICKER=$(jq .ticker txs.json)
rm txs.json
echo "$COUNT $TICKER"
echo "$COUNT $TICKER" >> pplog.txt

done
#######################################


# Sort Output Files
sort -g -r vlog.txt > vlog1.txt
sort -g -r plog.txt > plog1.txt
sort -g -r vplog.txt > vplog1.txt
sort -g -r pplog.txt > pplog1.txt
rm vlog.txt
rm plog.txt
rm vplog.txt
rm pplog.txt
echo "done"
