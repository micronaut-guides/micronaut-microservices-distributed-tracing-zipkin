start=`date +%s`
./gradlew --console=plain clean
echo "Starting microservices"
./gradlew run -parallel > /dev/null 2>&1 &
PID1=$!
echo "Waiting for microservices to start"
sleep 2
echo "Executing tests"
./gradlew --console=plain test
kill -9 $PID1 > /dev/null 2>&1
./gradlew --console=plain -stop
end=`date +%s`
runtime=$((end-start))
echo "execution took $runtime seconds"
