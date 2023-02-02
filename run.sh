dataset='Harbin'
future=12
past=12
nepochs=50
nlayers=10
gnn_input_dim=18
gnn_hidden_dim=64
enc_input_dim=64
enc_hidden_dim=64
dec_hidden_dim=64
output_dim=1
gpu="${1}"
#
traffic_path="data/${dataset}/traffic_df.pkl.gz"
lipschitz_path="data/${dataset}/lipschitz.npz"
adj_path="data/${dataset}/adj_mx.pkl"
seen_path="data/${dataset}/seen_30.npy"

# Now running in theatres!
if echo $* | grep -e "--debug" -q
then
        CUDA_VISIBLE_DEVICES=$gpu python3 -m pdb train.py --traffic_path "${traffic_path}" --lipschitz_path "${lipschitz_path}" --adj_path "${adj_path}" --seen_path "${seen_path}" --keep_tod --future "${future}" --past "${past}" --nepochs "${nepochs}" --nlayers "${nlayers}" --gnn_input_dim "${gnn_input_dim}" --gnn_hidden_dim "${gnn_hidden_dim}" --enc_input_dim "${enc_input_dim}" --enc_hidden_dim "${enc_hidden_dim}" --dec_hidden_dim "${dec_hidden_dim}" --output_dim "${output_dim}"
# debug
else
        CUDA_VISIBLE_DEVICES=$gpu python3 train.py --traffic_path "${traffic_path}" --lipschitz_path "${lipschitz_path}" --adj_path "${adj_path}" --seen_path "${seen_path}" --keep_tod --future "${future}" --past "${past}" --nepochs "${nepochs}" --nlayers "${nlayers}" --gnn_input_dim "${gnn_input_dim}" --gnn_hidden_dim "${gnn_hidden_dim}" --enc_input_dim "${enc_input_dim}" --enc_hidden_dim "${enc_hidden_dim}" --dec_hidden_dim "${dec_hidden_dim}" --output_dim "${output_dim}"
fi
