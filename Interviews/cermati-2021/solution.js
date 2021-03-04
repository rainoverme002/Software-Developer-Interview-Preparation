const config = require('./config/config')
const getHTMLPageContent = require('./services/GetterService')
const ParserService = require('./services/ParserService')
const SolutionService = require('./services/SolutionService')

// Initialize config
config
ARTICLE_INDEX_URL = process.env.BASE_URL + '/artikel'

getHTMLPageContent(ARTICLE_INDEX_URL).then((res) => {
    urls = ParserService.parseIndexPage(res.text);

    Promise.all(urls.map(url => {
        return getHTMLPageContent(process.env.BASE_URL + url).then((res) => {
            return Object.assign({
                'url': process.env.BASE_URL + url
            }, ParserService.parseArticlePage(res.text));
        });
    })).then((res) => {
        SolutionService.writeSolutionToFile(res, 'solution.json');
    })
}).catch((err) => console.log(err))