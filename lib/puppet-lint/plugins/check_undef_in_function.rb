PuppetLint.new_check(:undef_in_function) do
  def function_indexes
    @function_indexes ||= Proc.new do
      functions = []
      tokens.each_with_index do |token, token_idx|
        if token.type == :NAME && \
          (token_idx == 0 || (token_idx == 1 && tokens[0].type == :WHITESPACE) || token.prev_token.type == :NEWLINE || token.prev_token.type == :INDENT || \
            # function in a function
            (token.prev_code_token && token.prev_code_token.type == :LPAREN))

            level = 0
            real_idx = 0
            in_paren = false
            tokens[token_idx+1..-1].each_with_index do |cur_token, cur_token_idx|
              break if level == 0 && in_paren
              break if level == 0 && cur_token.type == :NEWLINE

              if cur_token.type == :LPAREN
                level += 1
                in_paren = true
              end
              level -= 1 if cur_token.type == :RPAREN
              real_idx = token_idx + 1 + cur_token_idx
            end

            functions << {
              :start  => token_idx,
              :end    => real_idx,
              :tokens => tokens[token_idx..real_idx],
            }         
        end
      end
      functions
    end.call
  end

  def check
    function_indexes.each do |func|
      func[:tokens].each do |token|
        if token.type == :UNDEF
          notify :warning, {
            :message => 'undef passed to a function',
            :line    => token.line,
            :column  => token.column,
            :token   => token,
          }
        end
      end
    end
  end
end
