## Install Pixi
```
curl -fsSL https://pixi.sh/install.sh | sh
source .bashrc
```

## Pixi environments dl and set-up
Clone the repo:
```
git clone https://github.com/JohGi/pixi-envs.git
```

Add the wrapper to your PATH (before the real Pixi path) in your .bashrc, to have in this order (adapt to fit your own paths):
```
export PATH="/home/girodollej/.pixi/bin:$PATH"
export PATH="$HOME/replicated/pixi-envs/bin:$PATH"
```

Source the .bashrc to set the proper PATH:
```
source ~/.bashrc
```

Create your own hook in each Pixi env (`main`, etc):
```
pixi shell-hook -s bash > activate.sh
```

## Usage
### For anyone
- Start an interactive shell in a Pixi environment:
```
cd /storage/replicated/cirad_users/girodollej/pixi-envs/main
pixi shell --frozen
cd -

# To exit:
exit
```

- Use the Pixi env in a job or script:
```
snakemake=/home/girodollej/replicated/pixi-envs/snakemake_7.32.4/activate.sh
sbatch --partition="cpu-dedicated" --account="dedicated-cpu@cirad-normal" --time="48:00:00" --wrap="source $snakemake; snakemake ..."
```

- Use the Pixi env interactively with the hook:
```
snakemake=/home/girodollej/replicated/pixi-envs/snakemake_7.32.4/activate.sh
source $snakemake
snakemake ...

# to exit the environment:
deactivate
```

### For me only
- Add a software to the main Pixi env:
```
cd /storage/replicated/cirad_users/girodollej/pixi-envs/main
pixi add egglib
```

- Create a new Pixi env to isolate a specific tool version:
```
cd /storage/replicated/cirad_users/girodollej/pixi-envs
pixi init snakemake_7.32.4
cd snakemake_7.32.4
pixi project channel add conda-forge
pixi project channel add bioconda
pixi shell-hook -s bash > activate.sh
pixi add snakemake=7.32.4
```


## Notes
Binaries are stored by default in : /home/girodollej/.cache/rattler/cache
They're shared among all pixi environments.
