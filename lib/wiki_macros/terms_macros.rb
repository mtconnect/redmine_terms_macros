# Member wiki macros
module TermsMacros
  module WikiMacros
    Redmine::WikiFormatting::Macros.register do
      desc "Includes a wiki page for a version. Examples:\n\n" +
             "{{include_page(Foo[,version])}}\n" +
             "{{include_page(projectname:Foo[,version])}} -- to include a page of a specific project wiki at a version"
      macro :include_page do |obj, args|        
        page = Wiki.find_page(args.first.to_s, :project => @project)
        raise 'Page not found' if page.nil? || !User.current.allowed_to?(:view_wiki_pages, page.wiki.project)
        @included_wiki_pages ||= []
        raise 'Circular inclusion detected' if @included_wiki_pages.include?(page.id)
        @included_wiki_pages << page.id
        version = args[1].to_s if args.length > 1    
        out = textilizable(page.content_for_version(version), :text, :attachments => page.attachments, :headings => false,  :inline_attachments => true)
        @included_wiki_pages.pop
        out
      end
    end
  end
end
