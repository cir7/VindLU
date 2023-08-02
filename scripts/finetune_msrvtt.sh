export VL_EXP_DIR="work_dirs"
export VL_DATA_DIR="data/msrvtt"
dataset=msrvtt # supported: msrvtt, anet
pt_name=pt_webvid_cc3m_8x64
ft_name=ft_12frm-${pt_name}-qa_${dataset}

ngpus=1
if [[ "$dataset" == *"anet"* ]]; then nfrm_test=32; else nfrm_test=12; fi

# finetune
python tools/run.py --nnodes 1 --ngpus ${ngpus} --task vqa \
    --jobname ${ft_name} --dep_jobname ${pt_name} \
    --config configs/qa_${dataset}.py \
    --model_args "pretrained_path ckpts/5M-pretrain.pth"