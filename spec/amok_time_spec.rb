RSpec.describe AmokTime do
  it 'has a version number' do
    expect(AmokTime::VERSION).not_to be nil
  end

  it 'is disabled by default' do
    expect(described_class).not_to be_enabled
  end

  describe '.enable!' do
    before { described_class.enable! }

    it 'enables the module' do
      expect(described_class).to be_enabled
    end

    it 'prepends all the mixins' do
      expect(Date.singleton_class).to be < AmokTime::Mixins::Date
      expect(Time.singleton_class).to be < AmokTime::Mixins::Time
      expect(DateTime.singleton_class).to be < AmokTime::Mixins::DateTime
    end
  end
end
