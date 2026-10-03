"""Library item base class."""

class libraryItem():
    """Base class for all library items."""

    def __init__(self, 
                 id: int, 
                 title: str, 
                 medium: str, 
                 genre: str,
                 description: str, 
                 fees: dict,
                 reserved_by: str | None = None,
                 lent_to: str | None = None):
        """Initiate library item.
        
        Arguments:
            id: int
                Individual identification number to uniquely identify 
                an item.
            title: str
                Item titel.
            medium: str
                Item medium, e. g. book, DVD or CD.
            genre: str
                Item's genre, e. g. documentary, action or romance.
            description: str
                Description of the item's content.
            fees: dict
                Fees that may need to be paid, including borrowing fee or
                fee to be paid if item is returned too late.
            reserved_by: str
                Person who has reserved to borrow the item.
            lent_to: str
                Person who the item is lent to. 
        
        Attributes:
            id: int
                Individual identification number to uniquely identify 
                an item.
            title: str
                Item titel.
            medium: str
                Item medium, e. g. book, DVD or CD.
            genre: str
                Item's genre, e. g. documentary, action or romance.
            description: str
                Description of the item's content.
            fees: dict
                Fees that may need to be paid, including borrowing fee or
                fee to be paid if item is returned too late.
            reserved_by: str
                Person who has reserved to borrow the item.
            lent_to: str
                Person who the item is lent to.
            borrowed_by: str
                Synonym to attribute 'lent_to'.
            lent: bool
                Status if the item is lent.
            borrowed: bool
                Synonym to attribute 'lent'.
            available: Status if the item is available.
        """

        # Item information
        self.id: int = id
        self.title: str = title
        self.medium: str = medium
        self.genre: str = genre
        self.description: str = description
        self.fees: dict = fees

        # Availability status
        self.reserved_by: str | None = reserved_by
        self.lent_to: str | None = lent_to
        self.borrowed_by: str | None = lent_to
        if self.reserved_by: 
            self.reserved: bool = True
            self.available: bool = False
        elif self.lent_to: 
            self.lent: bool = True
            self.borrowed: bool = True
            self.available: bool = False
        else:
            self.available: bool = True


    def check_availability(self) -> bool:
        """Check if an item is available to be lent.
        
        Returns
            available: bool
            Status if item is available."""

        return self.available


    def lend_to(self, borrower: str) -> None:
        """Lend specified item to borrower."""

        self.lent_to: str = borrower
        self.borrowed_by: str = borrower
        self.lent: bool = True
        self.borrowed: bool = True
        self.available: bool = False


    def give_back(self) -> None:
        """Give specified item back to library."""

        self.lent_to = None
        self.borrowed_by = None
        self.available: bool = False

