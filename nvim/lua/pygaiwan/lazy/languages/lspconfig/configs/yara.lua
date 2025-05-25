return {
	default_config = {
		cmd = { "yls", "-vv" },
		filetypes = { "yar", "yara" },
		single_file_support = true,
	},
	docs = {
		description = [[
https://pypi.org/project/yls-yara/

An YLS plugin adding YARA linting capabilities.

This plugin runs yara.compile on every save, parses the errors, and returns list of diagnostic messages.

Language Server: https://github.com/avast/yls

NOTE from myself: this plugin is a bit tricky to install it seems. It requires: 
    - dnf install python3.13-devel
    - a working yls executable in ~/.local/bin
    - it is needed to a vim filetype matching of yara
        ```
        vim.filetype.add({
            extension = {
                yara = "yara",
                yar = "yara",
            },
        })
        ```

If running `yls` from the command line returns: 

    ```
    TypeError: ForwardRef._evaluate() missing 1 required keyword-only argument: 'recursive_guard'
    ```
then make a venv, install yls and link it in ~/.local/bin. 

    ```
    $ pwd
    ~/.local/bin
    $ python3.10 -m venv venv
    $ source venv/bin/activate 
    $ pip install -r requirements.txt
    $ ls venv/bin/yls
    venv/bin/yls
    $ ln -s venv/bin/yls yls
    ```
requirements.txt:

attrs==25.3.0
cattrs==24.1.3
exceptiongroup==1.3.0
lsprotocol==2023.0.1
pluggy==1.6.0
pygls==1.3.1
typing_extensions==4.13.2
yara-python==4.5.2
yaramod==4.3.2
yari-py==0.2.1
yls==1.4.4
yls-yara==1.4.4

]],
	},
}
