# usage: tail -q -n +2 data/R*.CSV | awk -f script/liberal-vs-salarial.awk > analysis/liberal-vs-salarial.tsv
# computation time: 3m 19s

BEGIN {
  FS=";";
  OFMT="%d";
}

{
  count[$2"-"$11] += 1;
  cost[$2"-"$11] += $17 + $18;
}

END {
  print "SERIE\tpre_stj1\tcount\tcost"
  for(i in count){
    split(i, splited, "-")
    printf("%s\t%i\t%i\t%i\n", splited[1], splited[2], count[i], cost[i]);
  }
}
