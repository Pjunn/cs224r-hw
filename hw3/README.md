## Setup

Create a new conda environment `cs224r` by running `source setup_env.sh`

Then run the following commands when you're under the `hw3/` folder.

```
conda activate cs224r
pip install -r requirements.txt
pip install -e .
```

## TODOs

The TODOs and descriptions for code that needs to be implemented has been provided in the homework PDF.

### part 1 
use rnd
```
python cs224r/scripts/run_iql.py --env_name PointmassEasy-v0 \
--exp_name iql_zeta_0.9_rnd --use_rnd \
--num_exploration_steps=20000 \
--unsupervised_exploration \
--awac_lambda=1 \
--iql_expectile=0.9
```

```
python cs224r/scripts/run_iql.py --env_name PointmassMedium-v0 \
--exp_name iql_zeta_0.9_rnd --use_rnd \
--num_exploration_steps=20000 \
--unsupervised_exploration \
--awac_lambda=1 \
--iql_expectile=0.9
```

```
python cs224r/scripts/run_iql.py --env_name PointmassMedium-v0 \
--exp_name iql_zeta_0.9_random \
--num_exploration_steps=20000 \
--unsupervised_exploration \
--awac_lambda=1 \
--iql_expectile=0.9
```

part 2

```
python cs224r/scripts/run_cql.py --env_name PointmassHard-v0 \
--exp_name cql_alpha_0_rnd \
--use_rnd --unsupervised_exploration \
--offline_exploitation --cql_alpha=0
```

```
python cs224r/scripts/run_cql.py --env_name PointmassHard-v0 \
--exp_name cql_alpha_0.1_rnd \
--use_rnd --unsupervised_exploration \
--offline_exploitation --cql_alpha=0.1
```

```
python cs224r/scripts/run_cql.py --env_name PointmassHard-v0 \
--exp_name cql_alpha_0.1_random \
--unsupervised_exploration \
--offline_exploitation --cql_alpha=0.1
```