enum GroomsmensSide { groom, bride }

toSideText(GroomsmensSide side) =>
    side == GroomsmensSide.bride ? 'Noiva' : 'Noivo';
