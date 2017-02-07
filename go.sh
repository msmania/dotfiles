for i in *.conf; do
    src=$(readlink -f $i)
    dst=~/.${i%%.*}
    if [ -f "$dst" ]; then
        echo "$dst exists. skip."
    else
        cmd="ln -s $src $dst"
        echo $cmd
        $cmd
    fi
done

if ! [ -d ~/.vim/templates ]; then
  mkdir ~/.vim/templates
fi

for i in templates/*; do
    src=$(readlink -f $i)
    dst=~/.vim/$i
    if [ -f "$dst" ]; then
        echo "$dst exists. skip."
    else
        cmd="ln -s $src $dst"
        echo $cmd
        $cmd
    fi
done

if [ -d ~/.config/sublime-text-3/Packages/User ]; then
    for i in sublime-text-3/Packages/User/*.*; do
        fname=$(printf %q "$i")
        src=$(readlink -f "$fname")
        dst=~/.config/$fname
        if [ -f "$dst" ]; then
            echo "$dst exists. skip."
        else
            cmd="ln -s $src $dst"
            echo $cmd
            $cmd
        fi
    done
fi
