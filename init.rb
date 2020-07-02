Redmine::Plugin.register :redmine_terms_macros do
  name 'Macros for Terms Wiki Page Include'
  author 'William Sobel'
  description 'Recaptcha protection for the register page'
  version '0.9.1'
  url 'https://github.com/mtconnect/redmine_terms_macros'
  author_url 'https://wvsobel.llc'
end

require_dependency 'wiki_macros/terms_macros'

