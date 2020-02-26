import UIKit
import Foundation
import PlaygroundSupport

let txtLinkColor : UIColor = .init(red: 0.6, green: 0, blue: 0.03, alpha: 1.0)
let txtLinkBGColor : UIColor = .init(red: 0.8, green: 0.28, blue: 0.34, alpha: 1.0)
let btnBorderColor : UIColor = .init(red: 0.38, green: 0, blue: 0.02, alpha: 1.0)
let txtLinkColorVisited : UIColor = .init(red: 0.35, green: 0, blue: 0.03, alpha: 1.0)
let txtBodyColor : UIColor = .init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
let txtTitleColor : UIColor = .init(red: 0.3, green: 0, blue: 0.035, alpha: 1.0)
let txtBodyBGColor : UIColor = .init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)

let navBarBGImage = UIImage(named: "body_bg_small.png")

let lblContents = [
"Procedimentos de contenção especial: SCP-009 deve ser mantido em um quarto especialmente construído para imitar o de uma casa normal. Além da mobilia comum de um quarto, deve contar com um computador equipado com peças de última geração, sem admissão de falhas técnicas, como falta de energia ou componentes defeituosos. Manutenções devem ser realizadas mensalmente para a garantia do status do procedimento de contenção. O cômodo deve contar também com um pufe grande que deve ser mantido aproximadamente 65% cheio.",
"É essencial que ao lado da cama haja um espelho no qual conste espaço para no mínimo duas tomadas e duas saídas USB no mínimo 3.1 e idealmente 3.2.",
"Em caso de sinais de aflição ou simplesmente tédio iniciar umatransmissão da série de tv 'Bob Esponja Calça Quadrada', que parece terefeitos tranquilizantes/satisfatórios no SCP-Aoki.",
"SCP-Aoki é um jovem de ██ anos chamado Rodrigo Ryo Aoki que foi encontrado no campo 746-47-498, localizado em ███ ████████ ███████████, na cidade de Osasco, onde viveu sua vida inteira até o momento de atrair a atenção da SCP Foundation, possui uma personalidade tranquila e e amigável, frequentemente demonstrando ser prestativo.",
"Durante sua vivência em liberdade estudou no Ensino Fundamental I na escola [DATA EXPUNGED], e posteriormente estudou o Ensino Fundamental II e Médio na escola [DATA EXPUNGED].",
"Apresenta interesses comuns e inofensivos entre jovens em sua faixa etária, com um gosto especial para jogar videogames, ouvir música e assistir filmes.",
"Em relação à sua escolha de vestes, opta normalmente por roupas mais confortáveis, não necessáriamente considerando o apelo visual em si, a não ser em situações de interações sociais.",
"O elemento SCP-Aoki pôde ser observado frequentemente com os seus fones de ouvido intra-auriculares brancos, suportando o conhecimento da fundação sobre seus passa tempos.",
"Pouco antes da admissão do sujeito na fundação este ingressou no curso de jogos digitais no Centro Universitário Senac.",
"Aparentemente, SCP-Aoki também demonstra uma certa reserva em relação ao materialismo, guardando em seu quarto apenas itens de valor sentimental.",
"Bom, você sempre quis cursar jogos digitais?",
"E por que estudar programação em jogos digitais então e não BCC/TADS/etc...?",
"Certo, de acordo então com os resultados de recentes observações você será transferido para um novo projeto, muito obrigado pela cooperação.",
"Na verdade não, desde pequeno tive interesse em programação e gosto de jogar video-games, eu nem sabia da existência de um curso de graduação em jogos digitais.",
"Eu sentia que o curso focado somente nisso poderia vir a se tornar massante, então a graduação de jogos digitais foi uma boa solução, integrando um hobby com uma vocação profissional.",
"Nota especial sobre a situação do SCP-Aoki: Devido aos altos índices de capacidade e potencial observados em um período de ███ dias, a partir de ██/██/████ SCP-Aoki deve ser retirado de seu estado de contenção e será inserido no programa Apple Developer Academy, visando prover uma elevação do sujeito nas diversas habilidades que tal projeto incentiva e treina."
]

class CustomBtn : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawCustomBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawCustomBtn()
    }
    
    func drawCustomBtn() {
        backgroundColor = txtLinkColor
        showsTouchWhenHighlighted = true
        setTitle("Botão", for: .normal)
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 9.0
        layer.borderColor = btnBorderColor.cgColor
        layer.borderWidth = 1.5
    }
}

class ContentLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.lblStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        lblStyle()
    }
    
    func lblStyle() {
        text = "Placeholder"
        textColor = txtBodyColor
        numberOfLines = 0
        lineBreakMode = NSLineBreakMode.byWordWrapping
        textAlignment = .natural
    }
    
}

class HomepageViewController : UIViewController {
    
    var arrayLabels = [ContentLabel]()
    
    var button : CustomBtn!
    var img : UIImage!
    
    func getLblAnchors(lbl0: ContentLabel, lbl: ContentLabel, view: UIView) {
        NSLayoutConstraint.activate([
            lbl.topAnchor.constraint(equalTo: lbl0.bottomAnchor, constant: 20),
            lbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 360),
            lbl.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override func loadView() {
        
        let contentView = UIView()
        
        contentView.frame.size.height = 2080
        
        let homepageScrollView = UIScrollView()

        homepageScrollView.contentSize = contentView.frame.size
        homepageScrollView.addSubview(contentView)
        homepageScrollView.flashScrollIndicators()
        homepageScrollView.backgroundColor = .white

        img = navBarBGImage

        contentView.backgroundColor = txtBodyBGColor
        
        for i in 0...(lblContents.count - 1) {
            arrayLabels.append(ContentLabel())
            
            arrayLabels[i].text = lblContents[i]
            
            contentView.addSubview(arrayLabels[i])
            
            if i == 0 {
                NSLayoutConstraint.activate([
                    arrayLabels[i].topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                    arrayLabels[i].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                    arrayLabels[i].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 360),
                    arrayLabels[i].heightAnchor.constraint(equalToConstant: 200),
                ])
            }
            else {
                getLblAnchors(lbl0: arrayLabels[i-1], lbl: arrayLabels[i], view: contentView)
            }
            
            arrayLabels[i].translatesAutoresizingMaskIntoConstraints = false
            
//            print("\(i): \(arrayLabels[i].text ?? "aa")\n")
        }
        
        button = CustomBtn()
        
        button.setTitle("Teste custom", for: .normal)

//        contentView.addSubview(lbl)
//        contentView.addSubview(lbl2)
//        contentView.addSubview(button)
//        img.draw(in: CGRect.init(x: 10, y: 250, width: 200, height: 200))

//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl2.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
   
        
        NSLayoutConstraint.activate([
//            lbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            lbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            lbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 360),
//            lbl.heightAnchor.constraint(equalToConstant: 200),
//            lbl2.topAnchor.constraint(equalTo: lbl.bottomAnchor, constant: 20),
//            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 200),
//            button.widthAnchor.constraint(equalToConstant: 200),
//            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        self.view = homepageScrollView
    }
}


let rootViewController = HomepageViewController()
let navigationController = UINavigationController(rootViewController: rootViewController)
print("\(navigationController.navigationBar.frame.height)")
navigationController.navigationBar.setBackgroundImage(navBarBGImage, for: .top, barMetrics: .default)


PlaygroundPage.current.liveView = navigationController;
//https://makeapppie.com/2018/03/14/tip-creating-navigation-controllers/

/*
 Cores:
 fonte titulo #901
 link #b01
 link visitado #824
 texto body #333
 
 
 */


