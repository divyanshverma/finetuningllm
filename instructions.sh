WIP....

sudo apt install python3-pip
pip install --upgrade huggingface_hub
huggingface-cli login

huggingface-cli login
git clone https://github.com/hiyouga/LLaMA-Factory.git
cd LLaMA-Factory
pip install -e .[torch,metrics]

cd LLaMA-Factory/

nano examples/lora_multi_gpu/llama3_lora_sft.yaml
nano examples/inference/llama3_lora_sft.yaml
nano examples/merge_lora/llama3_lora_sft.yaml

CUDA_VISIBLE_DEVICES=0 llamafactory-cli train examples/lora_multi_gpu/llama3_lora_sft.yaml

CUDA_VISIBLE_DEVICES=0 python3 src/webui.py
#Export model
#OR
#sudo CUDA_VISIBLE_DEVICES=1 llamafactory-cli export examples/merge_lora/llama3_lora_sft.yaml

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
git clone git@github.com:divyanshverma/ollama.git ollama
cd ollama/
git submodule init
git submodule update llm/llama.cpp
python3 -m venv llm/llama.cpp/.venv
sudo apt install python3.10-venv
python3 -m venv llm/llama.cpp/.venv
source llm/llama.cpp/.venv/bin/activate
pip install -r llm/llama.cpp/requirements.txt
make -C llm/llama.cpp quantize
python llm/llama.cpp/convert.py ../LLaMA-Factory/models --outtype f16 --outfile converted.bin
python llm/llama.cpp/convert.py ../LLaMA-Factory/models --outtype f16 --vocab-type bpe --outfile converted.bin
ls
ls -ltr
llm/llama.cpp/quantize converted.bin quantized.bin q4_0
nano Modelfile
 #FROM quantized.bin
 #TEMPLATE "[INST] {{ .Prompt }} [/INST]"

ollama create divyllama3 -f Modelfile
ollama run divyllama3 "What is your favourite condiment?"
