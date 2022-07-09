;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     sql
     python
     ansible
     shell-scripts
     octave
     ruby
     (typescript :variables
                 typescript-fmt-on-save t
                 typescript-backend 'lsp)
     (html :variables
           css-enable-lsp t
           less-enable-lsp t
           scss-enable-lsp t
           html-enable-lsp t)
     (javascript :variables
                 javascript-fmt-on-save t
                 javascript-import-tool 'import-js
                 javascript-backend 'lsp
                 js2-basic-offset 2
                 js-indent-level 2)
     tern
     ivy
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-use-company-box t
                      auto-completion-idle-delay 0.3)
     (better-defaults :variables
                      better-defaults-move-to-beginning-of-code-first t
                      better-defaults-move-to-end-of-code-first t)
     emacs-lisp
     (git :variables
          git-magit-status-fullscreen t
          git-enable-github-support t
          git-gutter-use-fringe t)
     (markdown :variables markdown-live-preview-engine 'vmd)
     (multiple-cursors :variables
                       multiple-cursors-backend 'mc)
     (org :variables
          org-projectile-file "TODOs.org")
     (shell :variables
            shell-default-shell 'multi-term
            multi-term-program "/usr/local/bin/fish"
            shell-default-height 30
            shell-default-position 'bottom)
     (syntax-checking :variables
                      syntax-checking-enable-tooltips t
                      syntax-checking-enable-by-default t)
     (lsp :valiables
          lsp-lens-enable t
          lsp-signature-auto-activate nil
          lsp-enable-indentation nil
          lsp-enable-on-type-formatting nil
          lsp-file-watch-threshold 10000
          lsp-log-io nil)
     (clojure :variables
              clojure-enable-sayid t
              clojure-enable-clj-refactor t
              clojure-enable-fancify-symbols t
              ;;clojure-enable-linters 'clj-kondo
              clojure-indent-style 'align-arguments
              clojure-align-forms-automatically t
              cider-repl-display-help-banner nil
              cider-repl-use-pretty-printing nil
              cider-save-file-on-load t
              cider-prompt-for-symbol nil
              cider-repl-buffer-size-limit 10000)
     spell-checking
     (treemacs :variables
               treemacs-use-all-the-icons-theme t)
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     yaml
     nginx
     react
     ansible
     ;;dash
     restclient
     (colors :valiables
             colors-colorize-identifiers 'all)
     (php :valiables
          php-backend 'lsp)
     (terraform :variables
                terraform-auto-format-on-save t
                terraform-backend 'lsp)
     graphql
     japanese)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(yasnippet-snippets
     beacon
     cider-hydra
     org-preview-html)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(company-tern)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("HackGenNerd"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Variables
  (when (and (eq system-type 'darwin) (eq window-system 'ns))
    (setq ns-command-modifier (quote meta))
    (setq ns-option-modifier (quote super))
    (setq dired-use-ls-dired nil)

    (defun quick-look-dwim()
      (interactive)
      (call-process-shell-command
       (format "qlmanage %s -p  &>/dev/null"
               (treemacs--nearest-path (treemacs-current-button)))
       nil 0))

    (with-eval-after-load "treemacs"
      (define-key treemacs-mode-map (kbd "SPC") 'quick-look-dwim)))

  (setq-default
   rainbow-html-colors t
   rainbow-x-colors t
   rainbow-latex-colors t
   rainbow-ansi-colors t
   projectile-globally-ignored-files '("*.js" "*.cache.transit.json" "*.js.map" "*.jar")
   display-fill-column-indicator-column 80)

  ;; Modes
  (global-auto-revert-mode 1)
  (global-company-mode t)
  (global-rainbow-identifiers-mode)
  (beacon-mode 1)
  (volatile-highlights-mode t)

  ;; Hooks
  (add-hook 'prog-mode-hook #'rainbow-mode)
  (add-hook 'ansible-doc-mode-hook #'tab-line-mode)
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'clojure-mode-hook #'cider-hydra-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

  ;; Keybindings
  (keyboard-translate ?\C-h ?\C-?)
  (bind-keys
   ("M-/" . undo-tree-redo)
   ("C-c a" . evil-toggle-fold)
   ("M-o" . ace-window)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-s-." . mc/skip-to-next-like-this)
   ("C-s-," . mc/skip-to-previous-like-this)
   ("M-s-." . mc/unmark-next-like-this)
   ("M-s-," . mc/unmark-previous-like-this)
   ("C-c C->" . mc/mark-all-like-this)
   ("C-q" . treemacs)
   ("C-=" . imenu-list-smart-toggle)
   ("M-n" . (lambda () (interactive) (scroll-up 1)))
   ("M-p" . (lambda () (interactive) (scroll-down 1)))
   ("C-M-/" . ivy-yasnippet)
   ("C-c r" . ivy-switch-buffer)
   ("C-c k" . counsel-yank-pop)
   ("C-c i" . counsel-imenu)
   ("S-<left>" . windmove-left)
   ("S-<down>" . windmove-down)
   ("S-<up>" . windmove-up)
   ("S-<right>" . windmove-right)
   ("C-s-n" . next-buffer)
   ("C-s-p" . previous-buffer)
   ("M-m /" . counsel-git-grep)
   ("C-M-," . persp-prev)
   ("C-M-." . persp-next)

   :map smartparens-mode-map
   ("C-S-a" . sp-beginning-of-sexp)
   ("C-S-e" . sp-end-of-sexp)
   ("C-M-d" . sp-down-sexp)
   ("C-M-u" . sp-backward-up-sexp)
   ("C-M-e" . sp-up-sexp)
   ("C-M-a" . sp-backward-down-sexp)
   ("C-M-f" . sp-forward-sexp)
   ("C-M-b" . sp-backward-sexp)
   ("C-M-n" . sp-next-sexp)
   ("C-M-p" . sp-previous-sexp)
   ("C-<right>" . sp-forward-slurp-sexp)
   ("M-<right>" . sp-forward-barf-sexp)
   ("C-<left>" . sp-backward-slurp-sexp)
   ("M-<left>" . sp-backward-barf-sexp)
   ("C-M-t" . sp-transpose-sexp)
   ("C-k" . sp-kill-hybrid-sexp)
   ("C-M-k" . sp-kill-sexp)
   ("C-M-h" . sp-backward-kill-sexp)
   ("C-M-w" . sp-copy-sexp)
   ("C-M-m" . sp-backward-copy-sexp)
   ("M-]" . sp-unwrap-sexp)
   ("M-[" . sp-backward-unwrap-sexp)
   ("C-M-]" . sp-select-next-thing)
   ("C-M-[" . sp-select-previous-thing))

  ;; Font Setting
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "HackGenNerd"))

  ;; Org
  (with-eval-after-load 'org
    (setq org-startup-truncated nil)
    (setq org-hide-leading-stars t)
    (setq org-superstar-headline-bullets-list '("⚡" "" "" "" "" "" "" "" "" ""))
    (setq org-capture-templates
          '(("t" "Todo" entry (file+headline "~/aoba17/TODOs.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
            ("m" "Memo" entry (file+datetree "~/aoba17/memo.org")
             "* %?\nEntered on %U\n  %i\n  %a")))
    ;;(add-hook 'org-mode-hook #'visual-line-mode)
    ;;(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
    )
  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (mapcar #'(lambda (file)
                (when (file-exists-p file)
                  (push file org-agenda-files)))
            (org-projectile-todo-files)))

  ;; clojure-lsp
  (use-package lsp-mode
    :ensure t
    :hook ((clojure-mode . lsp-deferred)
           (clojurec-mode . lsp-deferred)
           (clojurescript-mode . lsp-deferred))
    :config
    ;; add paths to your local installation of project mgmt tools, like lein
    (setenv "PATH" (concat
                    "/usr/local/bin" path-separator
                    (getenv "PATH")))
    (dolist (m '(clojure-mode
                 clojurec-mode
                 clojurescript-mode
                 clojurex-mode))
      (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
    (setq lsp-clojure-server-command '("/usr/local/bin/clojure-lsp"))) ;; Optional: In case `clojure-lsp` is not in your $PATH

  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode)

  ;; magit forge
  (use-package forge
    :after magit)

  ;; terraform ls
  (require 'lsp-mode)
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("/usr/local/bin/terraform-ls" "serve"))
                    :major-modes '(terraform-mode)
                    :server-id 'terraform-ls))

  (add-hook 'terraform-mode-hook #'lsp-deferred)

  ;; japasene mode
  (with-eval-after-load "migemo"
    (require 'avy-migemo-e.g.ivy)
    (require 'avy-migemo-e.g.swiper)
    (require 'avy-migemo-e.g.counsel))

  ;; Other
  (custom-set-faces
   '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil))))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (sql-indent yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic jinja2-mode company-ansible ansible-doc ansible yasnippet-snippets rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby company insert-shebang fish-mode company-shell yaml-mode nginx-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help flycheck-pos-tip pos-tip unfill mwim mmm-mode markdown-toc markdown-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct diff-hl auto-dictionary tide typescript-mode flycheck web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode all-the-icons memoize smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download magit-gitflow magit-popup launchctl htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values
   (quote
    ((cider-default-cljs-repl . shadow)
     (cider-shadow-cljs-default-options . "app")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-migemo-function-names
   '((counsel-clj :around avy-migemo-disable-around)
     (counsel-grep :around counsel-grep-migemo-around)
     counsel-grep-function-migemo counsel-grep-occur-migemo
     (counsel-git-occur :around counsel-git-occur-migemo-around)
     (counsel-find-file-occur :around counsel-find-file-occur-migemo-around)
     swiper--make-overlays-migemo
     (swiper--re-builder :around swiper--re-builder-migemo-around)
     (ivy--regex :around ivy--regex-migemo-around)
     (ivy--regex-ignore-order :around ivy--regex-ignore-order-migemo-around)
     (ivy--regex-plus :around ivy--regex-plus-migemo-around)
     ivy--highlight-default-migemo ivy-occur-revert-buffer-migemo ivy-occur-press-migemo avy-migemo-goto-char avy-migemo-goto-char-2 avy-migemo-goto-char-in-line avy-migemo-goto-char-timer avy-migemo-goto-subword-1 avy-migemo-goto-word-1 avy-migemo-isearch avy-migemo-org-goto-heading-timer avy-migemo--overlay-at avy-migemo--overlay-at-full))
 '(evil-want-Y-yank-to-eol nil)
 '(lsp-enable-indentation nil)
 '(lsp-enable-on-type-formatting nil)
 '(package-selected-packages
   '(dap-mode bui sql-indent yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic jinja2-mode company-ansible ansible-doc ansible yasnippet-snippets rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby company insert-shebang fish-mode company-shell yaml-mode nginx-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help flycheck-pos-tip pos-tip unfill mwim mmm-mode markdown-toc markdown-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct diff-hl auto-dictionary tide typescript-mode flycheck web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode all-the-icons memoize smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download magit-gitflow magit-popup launchctl htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(safe-local-variable-values
   '((cider-default-cljs-repl . shadow)
     (cider-shadow-cljs-default-options . "app")))
 '(warning-suppress-log-types '((emacs) (emacs) (emacs)))
 '(warning-suppress-types '((emacs) (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t)
 '(hydra-posframe-border-face ((t (:background "#6272a4")))))
)
