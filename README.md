<div align="center">

# Encontre Aqui

### Catalogo de filmes iOS com secoes de destaque, navegacao por genero e detalhes completos -- construido com Swift, UIKit e UICollectionView

[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![UIKit](https://img.shields.io/badge/UIKit-0D96F6?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/documentation/uikit)
[![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)

</div>

---

## Sobre o Projeto

**Encontre Aqui** e um catalogo de filmes para iOS com mais de 100 titulos organizados em secoes -- Popular, Now Playing e Upcoming. O usuario pode navegar por genero, explorar todos os filmes de uma categoria e visualizar detalhes completos com poster, sinopse, avaliacao e generos.

> Encontre aqui o filme pra sua proxima sessao de cinema!

---

## Screenshots

<div align="center">

| Catalogo | Generos | Ver Todos |
|:---:|:---:|:---:|
| <img src="Screenshots/home.png" width="220"> | <img src="Screenshots/genres.png" width="220"> | <img src="Screenshots/seeall.png" width="220"> |

</div>

---

## Funcionalidades

- **3 secoes de filmes** -- Popular, Now Playing e Upcoming com scroll horizontal
- **Navegacao por genero** -- tab dedicada com cards por genero e contagem de filmes
- **See All** -- grid completo de filmes ao tocar "See all" em qualquer secao
- **Tela de detalhes** -- backdrop, poster, rating, generos, data e sinopse
- **+100 filmes catalogados** -- com poster, backdrop e informacoes completas
- **Tab bar intuitiva** -- Featured e Generos com icones visiveis e feedback visual

---

## Tecnologias

- **Swift** -- linguagem principal do desenvolvimento
- **UIKit** -- interface com Storyboard e ViewCode combinados
- **UICollectionView** -- collection views horizontais e grids programaticos
- **Auto Layout** -- constraints para layout responsivo
- **MVC** -- arquitetura com extensoes para DataSource e Delegate
- **UITabBarController** -- navegacao entre secoes com tab bar customizada
- **UINavigationController** -- hierarquia de navegacao com large titles

---

## Arquitetura

```
Encontre_Aqui/
├── Model/
│   ├── Movie.swift                              ← struct principal
│   ├── Movie+Popular.swift                      ← 20 filmes populares
│   ├── Movie+NowPlaying.swift                   ← 20 filmes em cartaz
│   ├── Movie+Upcoming.swift                     ← 20 filmes em breve
│   ├── Movie+TrendingThisWeek.swift             ← 20 filmes trending semana
│   └── Movie+TrendingToday.swift                ← 20 filmes trending hoje
├── Controllers/
│   ├── FeaturedViewController.swift             ← tela principal
│   ├── FeaturedViewController+DataSource.swift  ← populacao das cells
│   ├── FeaturedViewController+Delegate.swift    ← selecao e navegacao
│   ├── DetailsViewController.swift              ← tela de detalhes
│   ├── SeeAllViewController.swift               ← grid de todos os filmes
│   └── GenresViewController.swift               ← navegacao por genero
├── View/
│   ├── PopularCollectionViewCell.swift           ← cell backdrop grande
│   ├── NowplayingCollectionViewCell.swift        ← cell poster + ano
│   ├── UpcomingCollectionViewCell.swift           ← cell poster + ano
│   ├── SeeAllCell.swift                          ← cell do grid See All
│   ├── GenreCell.swift                           ← card de genero
│   └── Base.lproj/Main.storyboard               ← layout principal
└── Assets.xcassets/                              ← 100+ posters e backdrops
```

---

## Como Executar

1. Clone o repositorio
   ```bash
   git clone https://github.com/GeozedequeGuimaraes/EncontreAqui.git
   ```
2. Abra o arquivo `Encontre_Aqui.xcodeproj` no Xcode
3. Selecione um simulador ou dispositivo fisico (iOS 15.5+)
4. Execute o projeto com `Cmd + R`

---

## Autor

<div align="center">

**Geozedeque Guimaraes**

Estudante de Ciencia da Computacao -- CIn-UFPE

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/GeozedequeGuimaraes)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/geozedeque-guimaraes)

</div>
