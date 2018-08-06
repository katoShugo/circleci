# ACCTからサービスアカウントキーファイルを作成
echo $ACCT_AUTH | base64 -d > ${HOME}/gcloud-service-key.json

# gloudの設定
sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update
sudo /opt/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
sudo /opt/google-cloud-sdk/bin/gcloud config set project deploy-test-212203

# コンテナのUPLOAD
docker build -t asia.gcr.io/deploy-test-212203/hello-world .
sudo /opt/google-cloud-sdk/bin/gcloud docker -- push asia.gcr.io/deploy-test-212203/hello-world