# Blaze Scripts Handbags

A comprehensive handbag and accessory system for RedM roleplay servers.

## Overview

Blaze Scripts Handbags (bs-handbags) adds a collection of equippable handbags and accessories to your RedM server. This resource allows players to carry and display various types of bags, purses, and other accessories like canes, enhancing the roleplaying experience with period-appropriate items.

## Features

- 8 different handbags and accessories with unique models
- Proper 3D attachment to player character
- Toggle system (equip/unequip with the same item)
- Automatic model loading and cleanup
- Full integration with RSG Core inventory system
- Optimized resource with minimal performance impact

## Dependencies

- [rsg-core](https://github.com/Rexshack-RedM/rsg-core) - The core framework
- [ox_lib](https://github.com/overextended/ox_lib) - Utility library for notifications

## Installation

1. Ensure you have the required dependencies installed
2. Place the `bs-handbags` folder in your server's resources directory
3. Add `ensure bs-handbags` to your server.cfg
4. Restart your server

## Available Items

| Item Name | Label | Description | Model |
|-----------|-------|-------------|-------|
| bs_handbag_fancy | Elegant Handbag | An elegant handbag for special occasions | mp004_p_cs_jessicapurse01x |
| bs_handbag_penelope | Penelope Handbag | A fine handbag in Penelope style | s_penelopepurse01x |
| bs_handbag_purse1 | Fine Handbag | A fine handbag for the lady of society | s_pursefancy01x |
| bs_handbag_purse2 | Ornate Handbag | An artfully decorated handbag | s_pursefancy02x |
| bs_handbag_workbag | Work Bag | A sturdy bag for everyday work | p_bag01x |
| bs_handbag_classy | Classic Bag | A classic bag with timeless design | p_cs_bagstrauss01x |
| bs_handbag_doctor | Doctor's Bag | A bag for medical supplies | p_bag_leather_doctor |
| bs_handbag_cane | Walking Cane | An elegant cane for the distinguished gentleman | p_cane01x |

## Usage

1. Items are added to your shared lua automaticly on script start (edit in server.lua)
2. Players can use the item from their inventory to equip/unequip the handbag
3. The handbag will be visually attached to the player's left hand

## Developer Information

### Adding New Handbags

To add new handbags, edit the `server.lua` file and add a new entry to the `handbags` table:

```lua
{ 
    model = "model_name", 
    item = "bs_handbag_itemname", 
    label = "Display Name",
    weight = 150,
    description = "Item description"
}
```

Then add the attachment data in `client.lua` in the `attachData` table:

```lua
["model_name"] = {
    bone = "Skel_L_Hand", 
    pos = {x = 0.4, y = 0.0, z = 0.1}, 
    rot = {x = 70.0, y = 180.0, z = 90.0}
}
```

## License
This project is licensed under the GNU General Public License v3.0 (GPL-3.0). See [LICENSE](./LICENSE) for the full license text. 
This resource is an adaptation of the original handbags resource by Annihbal. Please respect the original developer's work and do not redistribute without permission.

## Credits

- Original resource by Annihbal (https://github.com/Annihbal/handbags) for VORP framework
- Adapted for RSG Core by Blaze Scripts
