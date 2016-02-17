VERSION=1.0.27.71.g0a26e3b2-9
DEBNAME=spotify-client_$(VERSION)_amd64.deb

all: repo data.tar.gz com.spotify.Client.json
	rm -rf spotify
	xdg-app-builder --repo=repo spotify com.spotify.Client.json

$(DEBNAME):
	wget "http://repository.spotify.com/pool/non-free/s/spotify-client/$(DEBNAME)"

data.tar.gz: $(DEBNAME)
	ar x $(DEBNAME)

repo:
	ostree  init --mode=archive-z2 --repo=repo
