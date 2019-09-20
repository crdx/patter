require_relative '../../lib/patter'

describe 'patter' do
    def provider_downcase
        double(:get_source => Source.new(['cheese']))
    end

    def provider_upcase
        double(:get_source => Source.new(['CHEESE']))
    end

    it 'applies attributes correctly' do
        expect(Pattern.new('{A}', provider_downcase).to_s).to eq('cheese')
        expect(Pattern.new('{A:s}', provider_downcase).to_s).to eq('cheeses')
        expect(Pattern.new('{A:t}', provider_downcase).to_s).to eq('Cheese')
        expect(Pattern.new('{A:u}', provider_downcase).to_s).to eq('CHEESE')
        expect(Pattern.new('{A:a}', provider_downcase).to_s).to eq('ChEeSe')

        expect(Pattern.new('{A:l}', provider_upcase).to_s).to eq('cheese')
    end

    it 'applies attribute combinations correctly' do
        expect(Pattern.new('{A:sa}', provider_downcase).to_s).to eq('ChEeSeS')
        expect(Pattern.new('{A:st}', provider_downcase).to_s).to eq('Cheeses')
    end

    it 'produces a single character for {C}, {S} and {D}' do
        expect(Pattern.new('{C}').to_s.length).to eq(1)
        expect(Pattern.new('{S}').to_s.length).to eq(1)
        expect(Pattern.new('{D}').to_s.length).to eq(1)
    end

    it 'produces repeating characters' do
        expect(Pattern.new('{C:5}').to_s.length).to eq(5)
    end
end
