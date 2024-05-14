WIP....

huggingface-cli login

cd LLaMA-Factory/

  155  nano examples/lora_multi_gpu/llama3_lora_sft.yaml
  156  nano examples/inference/llama3_lora_sft.yaml
  157  nano examples/merge_lora/llama3_lora_sft.yaml

CUDA_VISIBLE_DEVICES=0 llamafactory-cli train examples/lora_multi_gpu/llama3_lora_sft.yaml

~/LLaMA-Factory$ CUDA_VISIBLE_DEVICES=0 python3 src/webui.py
Export model
OR
sudo CUDA_VISIBLE_DEVICES=1 llamafactory-cli export examples/merge_lora/llama3_lora_sft.yaml

  232  eval "$(ssh-agent -s)"
  233  ssh-add ~/.ssh/id_rsa
  234  cat ~/.ssh/id_rsa.pub
  235  ssh -T git@github.com
  236  git clone git@github.com:divyanshverma/ollama.git ollama
  237  cd ollama/
  238  git submodule init
  239  git submodule update llm/llama.cpp
  240  python3 -m venv llm/llama.cpp/.venv
  241  sudo apt install python3.10-venv
  242  python3 -m venv llm/llama.cpp/.venv
  243  source llm/llama.cpp/.venv/bin/activate
  244  pip install -r llm/llama.cpp/requirements.txt
  245  make -C llm/llama.cpp quantize
  246  python llm/llama.cpp/convert.py ../LLaMA-Factory/models --outtype f16 --outfile converted.bin
  247  python llm/llama.cpp/convert.py ../LLaMA-Factory/models --outtype f16 --vocab-type bpe --outfile converted.bin
  248  ls
  249  ls -ltr
  250  llm/llama.cpp/quantize converted.bin quantized.bin q4_0
nano Modelfile
FROM quantized.bin
TEMPLATE "[INST] {{ .Prompt }} [/INST]"

ollama create divyllama3 -f Modelfile
ollama run divyllama3 "What is your favourite condiment?"
