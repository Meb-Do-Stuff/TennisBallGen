import matplotlib.pyplot as plt


def rebonds(h: int or float) -> list:
    """
    Cette fonction permet de calculer la hauteur de chaques rebonds d'une balle de tennis.

    :param h: Hauteur de départ.
    :return: Liste contenant la hauteur de chaques rebonds.
    """
    b = []
    while h > 0.1:
        b.append(h)
        h *= 0.75
    return b


def graphique(b: list) -> None:
    """
    Cette fonction permet de créer un graphique avec la hauteur de chaques rebonds.

    :param b: Liste contenant la hauteur de chaques rebonds.
    :return: None
    """
    plt.scatter(range(len(b)), b)
    plt.title("Hauteur de chaques rebonds")
    plt.xlabel("Nombre de rebonds")
    plt.ylabel("Hauteur")
    plt.savefig("graphique.png")


if __name__ == "__main__":
    bounces = rebonds(2)
    graphique(bounces)
