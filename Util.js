function roundToDecimalPlace(numToRound, places) {
    return Math.round(numToRound * Math.pow(10, places)) / Math.pow(10, places)
}
