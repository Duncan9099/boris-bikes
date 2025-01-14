require 'dockingstation'
require 'bike'

describe DockingStation do
  DEFAULT_CAPACITY = 20
  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  describe '#working?' do
    it 'tests bike is working' do
     bike = Bike.new
     expect(bike.working?).to eq true
    end
  end

  describe '#dock' do
    it 'returns docked bikes' do
     bike = Bike.new
     subject.dock(bike)
     expect(subject.bike).to eq @bikes
   end

   it 'raises an error for full capacity' do
    DEFAULT_CAPACITY.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error('Docking station full')
    end
  end

   describe '#release_bike' do
    it 'releases a bike' do
     bike = Bike.new
     subject.dock(bike)
     expect(subject.release_bike).to eq bike
   end

   it 'raises an error for no bikes' do
     expect {subject.release_bike}.to raise_error('No bikes available')
    end
  end

  describe '#initialize' do
    it 'takes a capacity argument upon initialization' do
    # 1. setup - given
    # dockingstation = DockingStation.new
    # 2. execute - when
    # 3. assert - then
    expect(DockingStation).to respond_to(:new).with(1).argument
    end

    # it 'has a default capacity of 20'
    # dockingstation = DockingStation.new
    # expect(dockingstation)


    end
  end



