## Описание

Попытка улучшить функциональность редактора доработкой файла конфигурации

## Как установить?

```
git clone https://github.com/aliev/.vim.git
echo "source ~/.vim/vimrc" > .vimrc # Подключаем файл конфигурации
vim +BundleInstall +qall # Ставим плагины из репозиторий
# Необходимо для работы command-t
cd .vim/bundle/command-t
rake make
```

## Из того что сделано:
1. Плагин Zen Coding
2. Автозакрытие парных html тегов (плагин html_autoclosetag)
3. Автоматическое закрытие парных блоков в Ruby (плагин endwise)
4. Подстветка парных html и xml тегов
5. NERDTree
6. Цветовая схема Solarized (для моих глаз одна из самых расслабляющих и приятных цветовых схем)
7. snipmate - сниппеты
8. Отображение специальных символов (символ переноса строки, конец строки, табуляция и т.д.)
9. Плагин Command-t
10. Fuzzy Finder
11. tagbar
12. Красивый статус бар (powerline)

## Несколько скриншотов

![command-t](https://dl.dropbox.com/u/5837324/images/command-t.png)
Command-T
![fuzzy-file](https://dl.dropbox.com/u/5837324/images/fuf.png)
FuzzyFile
![match-tag](https://dl.dropbox.com/u/5837324/images/match-tag.png)
MatchTag
