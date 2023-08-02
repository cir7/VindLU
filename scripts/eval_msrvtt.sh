export VL_EXP_DIR="/mnt/data/mmact/lilin/Repos/VindLU/work_dirs/"
export VL_DATA_DIR="data/msrvtt"
dataset=msrvtt # supported: msrvtt, anet
pt_name=pt_webvid_cc3m_8x64
ft_name=ft_12frm-${pt_name}-qa_${dataset}
ngpus=1
if [[ "$dataset" == *"anet"* ]]; then nfrm_test=32; else nfrm_test=12; fi

# evaluation
python tools/run.py --nnodes 1 --ngpus ${ngpus} --task vqa \
    --jobname ${ft_name}/eval_${nfrm_test}frm --dep_jobname ${ft_name} \
    --config configs/qa_${dataset}.py \
    --model_args "pretrained_path $VL_EXP_DIR/${ft_name}/ckpt_best.pth \
        evaluate True test_types 'eval([\"test\"])'  num_frames_test ${nfrm_test}" 