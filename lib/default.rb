require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"
require "syntax_tree"

module HiddenTextareaCode
  def block_code(code, language)
    <<~EOS
      <textarea hidden>#{code}</textarea>
      #{super}
    EOS
  end
end

module TurboBlockCode
  def block_code(code, language)
    digest = Digest::SHA1.hexdigest(code)
    <<~EOS
      <turbo-frame id="#{digest}">
        #{super}
      </turbo-frame>
    EOS
  end
end

module StreeBlockCode
  def block_code(code, language)
    @options.fetch(:widths).map { |width| <<~EOS }.join
      <div data-width="#{width}">
        #{super(SyntaxTree.format(code, width), language)}
      </div>
    EOS
  end
end
