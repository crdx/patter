require_relative '../lib/patter'

describe 'patter' do
    it 'applies attributes correctly' do
        provider = double(:get_source => Patter::Source.new(['potato']))
        expect(Patter::Pattern.new('{A}', provider).to_s).to eq('potato')
        expect(Patter::Pattern.new('{A:s}', provider).to_s).to eq('potatos')
        expect(Patter::Pattern.new('{A:t}', provider).to_s).to eq('Potato')
        expect(Patter::Pattern.new('{A:u}', provider).to_s).to eq('POTATO')
        expect(Patter::Pattern.new('{A:a}', provider).to_s).to eq('PoTaTo')

        provider = double(:get_source => Patter::Source.new(['POTATO']))
        expect(Patter::Pattern.new('{A:l}', provider).to_s).to eq('potato')
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
