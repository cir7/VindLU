fps=2
size=224
file_type=video
input_root=/mnt/data/mmact/data/msrvtt/videos
input_file_list_path=/mnt/data/mmact/lilin/Repos/VindLU/scripts/msrvtt_videos.txt
# you may use `ls -U ${input_root} > ${input_file_list_path}` to efficiently generate the file above.
output_root=/mnt/data/mmact/data/msrvtt/frames
python preprocess/compress.py \
--input_root=${input_root} --output_root=${output_root} \
--input_file_list_path=${input_file_list_path} \
--fps=${fps} --size=${size} --file_type=${file_type} --num_workers 24 