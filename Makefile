PHYON: deploy
deploy:
	@git config --global user.name onlypiglet && git config --global user.email jackwuchenghao@163.com && git add . && git commit -m "build" && git push --force
