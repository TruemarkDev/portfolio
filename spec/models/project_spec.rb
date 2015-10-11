require 'spec_helper'

describe Project do
  it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:title_ua).of_type(:string) }
  it { is_expected.to have_db_column(:is_published).of_type(:boolean).with_options(null: false, default: true) }
  it { is_expected.to have_db_column(:description).of_type(:text) }
  it { is_expected.to have_db_column(:description_ua).of_type(:text) }
  it { is_expected.to have_db_column(:info).of_type(:text) }
  it { is_expected.to have_db_column(:info_ua).of_type(:text) }
  it { is_expected.to have_db_column(:weight).of_type(:integer).with_options(null: false, default: 0) }
  it { is_expected.to have_db_column(:type).of_type(:string).with_options(null: false, default: 'project') }

  it { is_expected.to have_db_index :is_published }
  it { is_expected.to have_db_index :weight }

  it { is_expected.to validate_inclusion_of(:type).in_array(described_class::TYPES) }
end
