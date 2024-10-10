class modules::install_git {
    package { ‘git’:
    ensure      =&gt; latest,
}
}