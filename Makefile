OBJS=hello.cmo 
NAME=hello
OCAMLC=ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.syntax -syntax camlp4o

$(NAME).byte: $(OBJS)
	$(OCAMLC) -linkpkg -o $@ $(OBJS)

$(NAME).js: $(NAME).byte
	js_of_ocaml $<

%.cmo: %.ml
	$(OCAMLC) -c $<

all: hello.js
	node hello.js
