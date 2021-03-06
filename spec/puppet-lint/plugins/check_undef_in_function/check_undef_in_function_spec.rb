require 'spec_helper'

describe 'undef_in_function' do
  let (:msg) { 'undef passed to a function' }

  context 'with fix disabled' do
    context 'function call without undef value' do
      let (:code) {
        <<-EOS
        foo('somestring', '')
        bar(foo('hello'), 'world')
        baz 'hello', 'world'

        file { 'bar':
          source => undef,
        }
        EOS
      }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'function call with undef value' do
      let (:code) {
        <<-EOS
        foo('somestring', undef)
        bar(foo('hello'), undef)
        baz 'hello', undef
        EOS
      }

      it 'should detect two problems' do
        expect(problems).to have(3).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(27)
        expect(problems).to contain_warning(msg).on_line(2).in_column(27)
        expect(problems).to contain_warning(msg).on_line(3).in_column(22)
      end
    end
  end
end
