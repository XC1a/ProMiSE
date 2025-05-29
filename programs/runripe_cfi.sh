set -- "./ripe_attack_generator -t direct -i createfile -c ret  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i createfile -c funcptrstackvar  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i createfile -c funcptrstackparam  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i createfile -c structfuncptrstack  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i createfile -c funcptrheap  -l heap -f strncpy " \
"./ripe_attack_generator -t direct -i createfile -c structfuncptrheap  -l heap -f strncpy " \
"./ripe_attack_generator -t direct -i createfile -c structfuncptrbss  -l bss -f strncpy " \
"./ripe_attack_generator -t direct -i createfile -c funcptrdata  -l data -f strncpy " \
"./ripe_attack_generator -t direct -i createfile -c structfuncptrdata  -l data -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c ret  -l stack -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrstackvar  -l stack -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrstackparam  -l stack -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrheap  -l stack -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrbss  -l stack -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrdata  -l stack -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c ret  -l heap -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrstackvar  -l heap -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrstackparam  -l heap -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrheap  -l heap -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrbss  -l heap -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrdata  -l heap -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c ret  -l bss -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrstackvar  -l bss -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrstackparam  -l bss -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrheap  -l bss -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrbss  -l bss -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrdata  -l bss -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c ret  -l data -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrstackvar  -l data -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrstackparam  -l data -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrheap  -l data -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrbss  -l data -f strncpy " \
"./ripe_attack_generator -t indirect -i createfile -c funcptrdata  -l data -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c ret  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c funcptrstackvar  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c funcptrstackparam  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c structfuncptrstack  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c funcptrheap  -l heap -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c structfuncptrheap  -l heap -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c structfuncptrbss  -l bss -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c funcptrdata  -l data -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c structfuncptrdata  -l data -f strncpy " \
"./ripe_attack_generator -t direct -i rop -c ret  -l stack -f strncpy " \
"./ripe_attack_generator -t direct -i returnintolibc -c structfuncptrdata -l data -f noattack" \

export i=0
for test in "$@"; do
  echo "+++++++++++++++" > log_ripe_${i}
  echo $test | tee -a log_ripe_${i}
  sleep 1s
  $test 
  cd ../run_test_dfi
  sleep 1s
  ./test | tee -a ../run_ripe_cfi/log_ripe_${i}
  cd ../run_ripe_cfi
  export i="$(($i+1))"
done
