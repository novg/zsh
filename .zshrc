# Зададим путь до директории с плагинами Oh My Zsh
export ZSH="${ZDOTDIR}/oh-my-zsh"

# zsh-completion
autoload -Uz compinit && compinit

# Вставка \ перед ? и тп
# Меня лично это бесит
DISABLE_MAGIC_FUNCTIONS=true

# Здесь подключается antidote

# Если antidote установлен через пакетный менеджер, то путь до него будет выглядеть примерно так
# antidote_zsh='/usr/share/zsh-antidote.zsh'

# Если antidote был скачен через git, иначе закомментируйте следующую строку
antidote_zsh="$ZDOTDIR/.antidote/antidote.zsh"

if [ -f "$antidote_zsh" ]; then
  zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
  if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
    (
      source "$antidote_zsh"
      antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
    )
  fi
  source ${zsh_plugins}.zsh
fi

# Настройки истории
export HISTSIZE=100000
export SAVEHIST=100000

# Файл истории так же храним в ~/.config/zsh
export HISTFILE=$ZDOTDIR/.zsh_history

# Всякие алиасы я предпочитаю хранить как файлы с расширением `.zsh` в ~/.config/zsh/zshrc.d

# Тут мы создаем директорию, если ее нет
if [ ! -d "$ZDOTDIR/zshrc.d" ]; then
  mkdir -p "$ZDOTDIR/zshrc.d"
fi

# А тут: подключаем вспомогательные файлы
for src in $ZDOTDIR/zshrc.d/*.zsh; do
  . "$src"
done
