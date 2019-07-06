require_relative '../lib/patter'

describe 'patter' do
    def provider_downcase
        double(:get_source => Patter::Source.new(['potato']))
    end

    def provider_upcase
        double(:get_source => Patter::Source.new(['POTATO']))
    end

    it 'applies attributes correctly' do
        expect(Patter::Pattern.new('{A}', provider_downcase).to_s).to eq('potato')
        expect(Patter::Pattern.new('{A:s}', provider_downcase).to_s).to eq('potatos')
        expect(Patter::Pattern.new('{A:t}', provider_downcase).to_s).to eq('Potato')
        expect(Patter::Pattern.new('{A:u}', provider_downcase).to_s).to eq('POTATO')
        expect(Patter::Pattern.new('{A:a}', provider_downcase).to_s).to eq('PoTaTo')

        expect(Patter::Pattern.new('{A:l}', provider_upcase).to_s).to eq('potato')
    end

    it 'produces a single character for {C}, {S} and {D}' do
        expect(Patter::Pattern.new('{C}').to_s.length).to eq(1)
        expect(Patter::Pattern.new('{S}').to_s.length).to eq(1)
        expect(Patter::Pattern.new('{D}').to_s.length).to eq(1)
    end

    it 'produces repeating characters' do
        expect(Patter::Pattern.new('{C:5}').to_s.length).to eq(5)
    end
end
