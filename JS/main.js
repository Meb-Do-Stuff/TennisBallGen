const fs = require('fs');
const { ChartJSNodeCanvas } = require('chartjs-node-canvas');


/**
 * Cette fonction permet de calculer la hauteur de chaques rebonds d'une balle de tennis.
 *
 * @param h Hauteur de départ.
 */
function rebonds (h) {
    let hauteur = h;
    const b = [];
    while (hauteur > 0.1) {
        b.push(hauteur)
        hauteur *= 0.75
    }
    return b
}

/**
 * Cette fonction permet de créer un graphique avec la hauteur de chaques rebonds.
 *
 * @param b Liste contenant la hauteur de chaques rebonds.
 */
async function graphique(b) {
    const width = 400;
    const height = 400;
    const backgroundColour = 'white';
    const chartJSNodeCanvas = new ChartJSNodeCanvas({width, height, backgroundColour});

    const configuration = {
    type: 'scatter',
    data: {
        labels: Array.from(Array(b.length).keys()),
        datasets: [{
            label: "Sample 1",
            data: b,
            fill: false,
            borderColor: ['rgb(51, 204, 204)'],
        },
        ],
    },
    }

    const dataUrl = await chartJSNodeCanvas.renderToDataURL(configuration);
    const base64Data = dataUrl.replace(/^data:image\/png;base64,/, "");
    fs.writeFile("out.png", base64Data, 'base64', function(){});
}

bounces = rebonds(2)
graphique(bounces)
